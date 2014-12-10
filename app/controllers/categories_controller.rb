class CategoriesController < ApplicationController
  before_action :require_admin


def index
  @categories = Category.all
end


helper_method :sort_column, :sort_direction
def show
	@category = Category.find(params[:id])
  @category.products = @category.products.order(sort_column + " " + sort_direction)
end

def edit
	@category = Category.find(params[:id])
end

def update

  @category = Category.find(params[:id])
  if @category.update(category_params)
  redirect_to @category
  else
  render :edit
  end 
end


def new
  @category = Category.new
end

def create
  @category = Category.new(category_params)
  if @category.save
     redirect_to @category
  else
  render :new
  end
end


def destroy
  @category = Category.find(params[:id])
  @category.destroy
  redirect_to categories_url, alert: "Category successfully deleted!"
end



private

  def category_params
    params.require(:category).permit(:name)
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  end