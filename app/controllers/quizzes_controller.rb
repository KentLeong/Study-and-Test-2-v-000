class QuizzesController < ApplicationController
  before_action :check_signin
  def new
    @concept = Concept.find(params[:concept_id])
    @questions = @concept.questions
    @quiz = Quiz.new
  end

  def create
    @user_input = params[:user_answer][0]
    @question_ids = []
    @user_answers = []
    @questions = []
    @data = Hasher.recursive

    @user_input.count.times do |i|
      @answer = @user_input["question#{i+1}"][0][:user_answer]
      @question_ids << @user_input["question#{i+1}"][0][:question_id]
      if @answer != nil
        @user_answers << @answer
      else
        @user_answers << "_N/A_"
      end
    end
    get_data

    @percent = Quiz.get_percent(@data["correct"].count, @questions.count)
    @grade = Quiz.get_letter_grade(@percent)

    q = Quiz.find_or_create_by(quiz_params)
    params[:quiz][:question_ids] = @question_ids.join(SYN_PARSE)
    params[:quiz][:user_answers] = @user_answers.join(SYN_PARSE)
    params[:quiz][:percent] = @percent
    params[:quiz][:grade] = @grade
    q.update(quiz_params)
    session[:result] = q
    redirect_to :results, {notice: "Here are your results!"}
  end

  def results
    result = session[:result]
    @concept = Concept.find(result["concept_id"])
    @question_ids = result["question_ids"].split(SYN_PARSE)
    @user_answers = result["user_answers"].split(SYN_PARSE)
    @percent = result["percent"]
    @grade = result["grade"]
    @q_count = @question_ids.count
    @questions = []
    @data = Hasher.recursive
    get_data
  end
  private
    def check_signin
      redirect_to root_path, {alert: "You need to sign in first!"} if current_user == nil
    end
    def get_data
      @question_ids.each do |id|
        @questions << Question.find(id)
      end
      @questions.each_with_index do |q, index|
        if q.answer == @user_answers[index]
          @data["correct"]["correct#{index+1}"]["q"] = q
          @data["correct"]["correct#{index+1}"]["u_a"] = @user_answers[index]
          @data["correct"]["correct#{index+1}"]["q_n"] = index+1
        else
          @data["incorrect"]["incorrect#{index+1}"]["q"] = q
          @data["incorrect"]["incorrect#{index+1}"]["u_a"] = @user_answers[index]
          @data["incorrect"]["incorrect#{index+1}"]["q_n"] = index+1
        end
      end
    end

    def quiz_params
      params.require(:quiz).permit(:user_id, :concept_id, :question_ids, :user_answers, :percent, :grade)
    end

end
