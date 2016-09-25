class QuestionsController < ApplicationController
  before_action :find_question, except: [:new, :create]
  def new
    @concept = Concept.find(params[:concept_id])
    @question = Question.new(qtype: "multiple_choice")
  end

  def create
    @question = Question.create(question_params)
    question_action(:save, "create")
  end

  def edit
    @concept = @question.concept
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
    end
    def question_action(action, type)
      if @question.send(action)
        redirect_to concept_path(@question.concept), {notice: "Successfully #{type}d question."}
      else
        redirect_to concept_path(@question.concept), {alert: "Sorry, could not #{type} question."}
      end
    end
    def question_params
      params.require(:question).permit(:inquest, :answer, :qtype, :concept_id, :user_id, :difficulty)
    end
end
