class ConceptsController < ApplicationController
  before_action :find_concept, only: [:show, :edit, :update, :destroy]
  before_action :find_category_subcategory, only: [:show, :new, :edit, :create, :destroy]
  def show
  end

  def new
    @concept = Concept.new
  end

  def edit
  end

  def update
    @concept.update(concept_params)
    concept_action(:save, "update")
  end

  def create
    @concept = Concept.create(concept_params)
    concept_action(:save, "create")
  end

  def destroy
    concept_action(:destroy, "delete")
  end
  private
    def find_category_subcategory
      @category = Category.find(params[:category_id])
      @subcategory = Subcategory.find(params[:subcategory_id])
    end
    def find_concept
      @concept = Concept.find(params[:id])
    end
    def concept_action(action, type)
      if concept.send(action)
        redirect_to category_subcategory_path(@category, @subcategory), {notice: "Successfully #{type}d concept."}
      else
        redirect_to category_subcategory_path(@category, @subcategory), {alert: "Sorry, could not #{type} concept."}
      end
    end
    def concept_params
      params.require(:concept).permit(:name, :subcategory_id, :category_id, :description)
    end
end
