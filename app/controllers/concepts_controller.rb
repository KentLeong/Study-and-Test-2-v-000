class ConceptsController < ApplicationController
  before_action :find_concept, except: [:new, :create]
  def show
  end

  def new
    @concept = Concept.new
    @subcategory = Subcategory.find(params[:subcategory_id])
  end

  def edit
    @subcategory = @concept.subcategory
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
    def find_concept
      @concept = Concept.find(params[:id])
    end
    def concept_action(action, type)
      if @concept.send(action)
        redirect_to subcategory_path(@concept.subcategory), {notice: "Successfully #{type}d concept."}
      else
        redirect_to subcategory_path(@concept.subcategory), {alert: "Sorry, could not #{type} concept."}
      end
    end
    def concept_params
      params.require(:concept).permit(:name, :subcategory_id, :description)
    end
end
