class SubcategoriesController < ApplicationController
  before_action :find_subcategory, except: [:new, :create]
  def show
  end

  def new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.new
  end

  def edit
    @category = Category.find(@subcategory.category)
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

    def find_subcategory
      @subcategory = Subcategory.friendly.find(params[:id])
    end

    def subcategory_action(action, type)
      if @subcategory.send(action)
        redirect_to category_path(@subcategory.category), {notice: "Successfully #{type}d subcategory"}
      else
        redirect_to category_path(@subcategory.category), {alert: "Sorry, could not #{type} subcategory."}
      end
    end

    def subcategory_params
      params.require(:subcategory).permit(:name, :category_id)
    end
end
