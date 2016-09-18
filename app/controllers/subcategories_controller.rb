class SubcategoriesController < ApplicationController
  before_action :find_subcategory, only: [:show, :edit, :update, :destroy]
  before_action :find_category, only: [:show, :new, :edit]

  def show
  end

  def new
    @subcategory = Subcategory.new
  end

  def edit
  end

  def update
    @subcategory.update(subcategory_params)
    subcategory_action(:save, "update")
  end

  def create
    @subcategory = Subcategory.create(subcategory_params)
    subcategory_action(:save, "create")
  end

  def destroy
    subcategory_action(:destroy, "delete")
  end
  private
    def find_category
      @category = Category.find(params[:category_id])
    end

    def find_subcategory
      @subcategory = Subcategory.find(params[:id])
    end
    def subcategory_action(action, type)
      if @subcategory.send(action)
        redirect_to category_path(params[:category_id]), {notice: "Successfully #{type}d subcategory"}
      else
        redirect_to category_path(params[:category_id]), {alert: "Sorry, could not #{type} subcategory."}
      end
    end

    def subcategory_params
      params.require(:subcategory).permit(:name, :category_id)
    end
end
