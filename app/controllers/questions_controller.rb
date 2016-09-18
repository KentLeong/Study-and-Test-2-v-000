class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @concept = Concept.find(params[:concept_id])
  end

  def create
    category = Category.find(params[:category_id])
    subcategory = Subcategory.find(params[:subcategory_id])
    concept = Concept.find(params[:concept_id])
    question = Question.create(question_params)
    if question.save
      redirect_to category_subcategory_concept_path(category, subcategory, concept), {notice: "Successfully create question."}
    else
      redirect_to category_subcategory_concept_path(category, subcategory, concept), {alert: "Could not create question."}
    end
  end

  private
    def question_params
      params.require(:question).permit(:inquest, :answer, :qtype, :concept_id, :user_id, :difficulty)
    end
end
