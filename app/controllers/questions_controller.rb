class QuestionsController < ApplicationController
  before_action :find_question, except: [:new, :create]
  before_action :validate_admin
  def new
    @concept = Concept.find(params[:concept_id])
    @question = Question.new()
    @randos = ["", "", ""]
  end

  def create
    @randos = params[:random_qs][0]
    if @randos.include? nil
      redirect_to request.referrer, {alert: "You need at least 2 rando questions!"} if @randos.count < 2
    end

    @question = Question.create(question_params)

    @randos.each do |rando|
      params[:rando] = {
        name: rando,
        question_id: @question.id
      }
      @question.random_questions << RandomQuestion.create(rando_params)
    end
    RandomQuestion.create()
    question_action(:save, "create")
  end

  def edit
    @concept = @question.concept
    @randos = @question.random_questions
  end

  def update
    @randos = params[:random_qs][0]
    @question.random_questions.each_with_index do |rq, index|
      params[:rando] = {
        name: @randos["random#{index+1}"],
        question_id: @question.id
      }
      rq.update(rando_params)
    end
    @question.update(question_params)
    question_action(:save, "update")
  end

  def destroy
    question_action(:destroy, "delete")
  end

  private
    def find_question
      @question = Question.find(params[:id])
    end
    def question_action(action, type)
      if @question.send(action)
        redirect_to concept_path(@question.concept), {notice: "Successfully #{type}d question."}
      else
        redirect_to request.referrer, {alert: "Sorry, could not #{type} question."}
      end
    end
    def rando_params
      params.require(:rando).permit(:name, :question_id)
    end
    def question_params
      params.require(:question).permit(:inquest, :answer, :concept_id, :user_id, :difficulty)
    end
end
