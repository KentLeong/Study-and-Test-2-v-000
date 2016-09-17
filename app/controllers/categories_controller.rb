class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @subcategories = @category.subcategories
  end
end
