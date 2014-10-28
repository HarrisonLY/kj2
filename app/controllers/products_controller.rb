class ProductsController < ApplicationController
  before_action :require_signin
  before_action :require_admin, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

def index
  case params[:scope] 
  when 'past'
    @products = Product.past
  when 'upcoming'
    @products = Product.upcoming
  when 'tba'
    @products = Product.tba
  else
    @products = Product.trending
  end
end

def show
  @clockers = @product.clockers
  @categories = @product.categories

  if current_user
  @current_clock = current_user.clocks.find_by(product_id: @product.id)
  end
end

def edit
end

def update

  if @product.update(product_params)
  redirect_to @product
  else
  render :edit
  end 
end

def new
  @product = Product.new
end

def create
  @product = Product.new(product_params)
  if @product.save
     redirect_to @product
  else
  render :new
  end
end


def destroy
  @product.destroy
  redirect_to products_url, alert: "Product successfully deleted!"
end


private

    def product_params
      params.require(:product).permit(:slug, :name, :description, :price, :releasing_on, :website, :image_file_name, category_ids: [])
    end

  def set_product
    @product = Product.find_by!(slug: params[:id])
  end

  end

