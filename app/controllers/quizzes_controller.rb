class QuizzesController < ApplicationController
  def new
    @concept = Concept.find(params[:concept_id])
    @questions = @concept.questions
    @quiz = Quiz.new
  end

  def create
    @user_input = params[:user_answer][0]
    @question_id = []
    @user_answer = []
    @user_input.count.times do |i|
      @answer = @user_input["question#{i+1}"][0][:user_answer]
      @question_id << @user_input["question#{i+1}"][0][:question_id]
      if @answer != nil
        @user_answer << @answer
      else
        @user_answer << "_nil_"
      end
    end
    params[:quiz][:question_ids] = @question_id.join(SYN_PARSE)
    params[:quiz][:user_answers] = @user_answer.join(SYN_PARSE)
    q = Quiz.find_or_create_by(user_id: params[:quiz][:user_id], concept_id: params[:quiz][:concept_id])
    q.update(quiz_params)
    session[:result] = q
    redirect_to :results, {notice: "Here are your results!"}
  end

  def results
    result = session[:result]
    @concept = Concept.find(result["concept_id"])
    @question_ids = result["question_ids"].split(SYN_PARSE)
    @user_answers = result["user_answers"].split(SYN_PARSE)
    @questions = []
    @q_count = @question_ids.count
    @data = Hasher.recursive


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
    @percent = Quiz.get_percent(@data["correct"].count, @q_count)
    @grade = Quiz.get_letter_grade(@percent)
  end
  private
    def grade()
    end
    def quiz_params
      params.require(:quiz).permit(:user_id, :concept_id, :question_ids, :user_answers)
    end

end
