class QuizzesController < ApplicationController
  before_action :check_signin
  def new
    @concept = Concept.find(params[:concept_id])
    @questions = @concept.questions
    @quiz = Quiz.new
  end

  def create
    params[:quiz][:question_ids] = []
    params[:quiz][:user_answers] = []
    params[:answers].each do |question_id, user_answer|
      params[:quiz][:question_ids] << question_id
      params[:quiz][:user_answers] << user_answer
    end
    params[:quiz][:percent]= Quiz.get_percent(params[:answers])
    params[:quiz][:grade] = Quiz.get_grade(params[:quiz][:percent])
    quiz = Quiz.create(quiz_params)
    redirect_to quiz_path(quiz.id)
  end

  def show
    @quiz = Quiz.find(params[:id])
    @concept = @quiz.concept
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @quiz}
    end
  end

  private
    def check_signin
      redirect_to root_path, {alert: "You need to sign in first!"} if current_user == nil
    end

    def quiz_params
      questions_params = [ :question_id, :user_answer ]
      params.require(:quiz).permit(:user_id, :concept_id, :percent, :grade, question_ids: [], user_answers: [])
    end

end
