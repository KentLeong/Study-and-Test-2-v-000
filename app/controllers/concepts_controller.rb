class ConceptsController < ApplicationController
  before_action :find_concept, except: [:new, :create]
  before_action :validate_admin, except: [:show]
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
    @subcategory = Subcategory.find(params[:subcategory_id])
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
        redirect_to root_path, {notice: "Successfully #{type}d concept!"}
      else
        case type
        when "update"
          render :edit
        when "create"
          render :new
        else
          redirect_to request.referrer, {alert: "Sorry, could not #{type} concept!"}
        end
      end
    end
    def concept_params
      params.require(:concept).permit(:name, :subcategory_id, :description)
    end
end
