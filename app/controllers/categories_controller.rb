class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
  end

  def new
    @category = Category.new
  end

  def create
    if category = Category.create(category_params)
      redirect_to root_path, {notice: "Successfully created category!"}
    else
      redirect_to root_path, {notice: "Sorry, could not create category."}
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
