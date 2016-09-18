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

  def edit
    @question = Question.find(params[:id])
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @concept = Concept.find(params[:concept_id])
  end

  def update
    @question = Question.find(params[:id])
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @concept = Concept.find(params[:concept_id])
    @quetion.update(question_params)
    if @question.save
      redirect_to category_subcategory_concept(@category, @subcategory, @concept), {notice: "Successfully saved question."}
    else
      redirect_to category_subcategory_concept(@category, @subcategory, @concept), {alert: "Could not save question."}
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @concept = Concept.find(params[:concept_id])

    if @question.destroy
      redirect_to category_subcategory_concept_path(@category, @subcategory, @concept), {notice: "Successfully destroyed question."}
    else
      redirect_to category_subcategory_concept_path(@category, @subcategory, @concept), {alert: "Could not destroy question."}
    end
  end

  private
    def question_params
      params.require(:question).permit(:inquest, :answer, :qtype, :concept_id, :user_id, :difficulty)
    end
end
