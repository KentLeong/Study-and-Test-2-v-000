class SubcategoriesController < ApplicationController
  before_action :find_subcategory, except: [:new, :create]
  before_action :validate_admin, except: [:show]
  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @subcategory}
    end
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
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.create(subcategory_params)
    subcategory_action(:save, "create")
  end

  def destroy
    subcategory_action(:destroy, "delete")
  end
  private

    def find_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    def subcategory_action(action, type)
      if @subcategory.send(action)
        redirect_to root_path, {notice: "Successfully #{type}d subcategory!"}
      else
        case type
        when "update"
          render :edit
        when "create"
          render :new
        else
          redirect_to request.referrer, {alert: "Sorry, could not #{type} subcategory!"}
        end
      end
    end

    def subcategory_params
      params.require(:subcategory).permit(:name, :category_id)
    end
end
