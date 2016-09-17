class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    if category.save
      redirect_to root_path, {notice: "Successfully updated category!"}
    else
      redirect_to root_path, {alert: "Sorry, could not update category."}
    end
  end

  def create
    if category = Category.create(category_params)
      redirect_to root_path, {notice: "Successfully created category!"}
    else
      redirect_to root_path, {alert: "Sorry, could not create category."}
    end
  end

  def delete
    category = Category.find(params[:id])
    if category.destroy
      redirect_to root_path, {notice: "Successfully deleted category!"}
    else
      redirect_to root_path, {alert: "Sorry, could not delete category."}
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
