class ProductsController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]


def index
  @product = Product.find_by(params[:id]) 
  @categories = Category.all
  case params[:scope] 
  when 'past'
    @products = Product.past.page(params[:page]).per_page(24)
  when 'upcoming'
    @products = Product.upcoming.page(params[:page]).per_page(24)
  when 'tba'
    @products = Product.tba.page(params[:page]).per_page(24)
  when 'newest'
    @products = Product.newest.page(params[:page]).per_page(24)
  else
    @products = Product.trending.page(params[:page]).per_page(24)
  end

  if current_user
  @current_clock = current_user.clocks.find_by(product_id: @product.id)
  end

  respond_to do |format|
    format.html
    format.js
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
  redirect_to "/products/filter/trending", alert: "Product successfully deleted!"
end


private

    def product_params
      params.require(:product).permit(:slug, :name, :description, :price, :releasing_on, :website, :company, :image, :image_content_type, :picture, :picture_content_type, :picture1, :picture1_content_type, :picture2, :picture2_content_type, :picture3, :picture3_content_type, :picture4, :picture4_content_type, :picture5, :picture5_content_type, :picture6, :picture6_content_type, :picture7, :picture7_content_type, :picture8, :picture8_content_type, :picture9, :picture9_content_type, category_ids: [])
    end

  def set_product
    @product = Product.find_by!(slug: params[:id])
  end

  end

