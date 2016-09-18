class ConceptsController < ApplicationController
  def show
    @concept = Concept.find(params[:id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @category = Category.find(params[:category_id])
  end

  def new
    @concept = Concept.new
    @subcategory = Subcategory.find(params[:subcategory_id])
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    concept = Concept.create(concept_params)
    if concept.save
      redirect_to category_subcategory_path(@category, @subcategory), {notice: "Successfully created concept"}
    else
      redirect_to category_subcategory_path(@category, @subcategory), {alert: "Could not create concept"}
    end
  end

  private
    def concept_params
      params.require(:concept).permit(:name, :subcategory_id, :category_id)
    end
end
