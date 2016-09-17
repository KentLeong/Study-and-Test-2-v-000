class SubcategoriesController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.new
  end

  def create
    subcategory = Subcategory.create(subcategory_params)
    binding.pry
    if subcategory.save
      redirect_to category_path(params[:category_id]), {notice: "Successfully created subcategory"}
    else
      redirect_to category_path(params[:category_id]), {alert: "Subcategory was not created"}
    end
  end

  private
    def subcategory_params
      params.require(:subcategory).permit(:name, :category_id)
    end
end
