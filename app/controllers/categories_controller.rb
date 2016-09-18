class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  def show
    @subcategories = @category.subcategories
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    @category.update(category_params)
    category_action(:save, "save")
  end

  def create
    @category = Category.create(category_params)
    category_action(:save, "create")
  end

  def destroy
    category_action(:destroy, "delete")
  end

  private

    def category_action(action, type)
      if @category.send(action)
        redirect_to root_path, {notice: "Successfully #{type}d category!"}
      else
        redirect_to root_path, {alert: "Sorry, could not #{type} category."}
      end
    end

    def find_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
