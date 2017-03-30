class CategoriesController < ApplicationController
  before_action :find_category, except: [:new, :create]
  before_action :validate_admin, except: [:show]
  def show
    @subcategories = @category.subcategories
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @category}
    end
  end

  def new
    @category = Category.new
    render "categories/new", layout: false
  end

  def edit
    render "categories/edit", layout: false
  end

  def update
    @category.update(category_params)
    category_action(:save, "update")
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
        case type
        when "update"
          render :edit
        when "create"
          render :new
        else
          redirect_to request.referrer, {alert: "Sorry, could not #{type} category!"}
        end
      end
    end

    def find_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
