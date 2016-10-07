class QuestionsController < ApplicationController
  before_action :find_question, except: [:new, :create]
  before_action :validate_admin
  def new
    @concept = Concept.find(params[:concept_id])
    @question = Question.new()
  end

  def create
    @concept = Concept.find(params[:concept_id])
    @question = Question.create(question_params)
    question_action(:save, 'create')
  end

  def edit
    @wrong_answers = @question.wrong_answers
  end

  def update
    @question.update(question_params)
    question_action(:save, "update")
  end

  def destroy
    question_action(:destroy, "delete")
  end

  private
    def find_question
      @question = Question.find(params[:id])
      @concept = @question.concept
    end
    def question_action(action, type)
      if @question.send(action)
        redirect_to concept_path(@concept), {notice: "Successfully #{type}d question!"}
      else
        case type
        when "update"
          render :edit
        when "create"
          render :new
        else
          redirect_to request.referrer, {alert: "Sorry, could not #{type} question!"}
        end
      end
    end
    def rando_params
      params.require(:rando).permit(:name, :question_id)
    end
    def question_params
      params.require(:question).permit(:inquest, :answer, :concept_id, :user_id, :difficulty, wrong_answers: [])
    end
end
