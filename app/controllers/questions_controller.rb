class QuestionsController < ApplicationController
  before_action :find_question, except: [:new, :create]
  before_action :find_category_subcategory_concept
  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    question_action(:save, "create")
  end

  def edit
  end

  def update
    @question.update(question_params)
    question_action(:save, "update")
  end

  def destroy
    question_action(:destroy, "delete")
  end

  private
    def find_category_subcategory_concept
      @category = Category.find(params[:category_id])
      @subcategory = Subcategory.find(params[:subcategory_id])
      @concept = Concept.find(params[:concept_id])
    end
    def find_question
      @question = Question.find(params[:id])
    end
    def question_action(action, type)
      if @question.send(action)
        redirect_to category_subcategory_concept_path(@category, @subcategory, @concept), {notice: "Successfully #{type}d question."}
      else
        redirect_to category_subcategory_concept_path(@category, @subcategory, @concept), {alert: "Sorry, could not #{type} question."}
      end
    end
    def question_params
      params.require(:question).permit(:inquest, :answer, :qtype, :concept_id, :user_id, :difficulty)
    end
end
