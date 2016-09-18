class SubcategoriesController < ApplicationController
  def show
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:id])
  end
  
  def new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.new
  end

  def edit
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:id])
  end

  def update
    subcategory = Subcategory.find(params[:id])
    subcategory.update(subcategory_params)
    if subcategory.save
      redirect_to category_path(params[:category_id]), {notice: "Successfully edited subcategory"}
    else
      redirect_to category_path(params[:category_id]), {alert: "Subcategory was not edited"}
    end
  end

  def create
    subcategory = Subcategory.create(subcategory_params)
    if subcategory.save
      redirect_to category_path(params[:category_id]), {notice: "Successfully created subcategory"}
    else
      redirect_to category_path(params[:category_id]), {alert: "Subcategory was not created"}
    end
  end

  def destroy
    subcategory = Subcategory.find(params[:id])
    if subcategory.destroy
      redirect_to category_path(params[:category_id]), {notice: "Successfully deleted subcategory"}
    else
      redirect_to category_path(params[:category_id]), {alert: "Subcategory was not deleted"}
    end
  end
  private
    def subcategory_params
      params.require(:subcategory).permit(:name, :category_id)
    end
end
