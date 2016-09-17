class SubcategoriesController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:id])
  end
end
