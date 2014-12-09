class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :image, :tutorial]
  before_action :require_admin, only: [:index, :destroy]


def index
  @users = User.all
end


  helper_method :sort_column, :sort_direction
def show
  @user = User.find(params[:id])
  @clocked_products = @user.clocked_products

  case params[:scope] 
  when 'before'
    @clocked_products = Product.before
  when 'unknown'
    @clocked_products = Product.unknown
  else 'future'
    @clocked_products = Product.future

  end
    respond_to do |format|
    format.html
    format.js
  end
end

def new
  @user = User.new
    if current_user
      redirect_to "/products/filter/trending"
    end
end


def create
  @user = User.new(user_params) 
  if @user.save
    session[:user_id] = @user.id
    redirect_to users_tutorial_url (@user)
  else
    render :new
  end 
end

def edit
end


def update
  if @user.update(user_params)
    redirect_to @user
    flash[:notice] = "Account successfully updated!"
  else
    render :edit
  end
end


def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to root_url, alert: "Account successfully deleted!"
end


def image
  @user = User.find(params[:id])
  @clocked_products = @user.clocked_products



  case params[:scope] 
  when 'before'
    @clocked_products = Product.before
  when 'unknown'
    @clocked_products = Product.unknown
  else 'future'
    @clocked_products = Product.future
  end
  respond_to do |format|
    format.html
    format.js
  end
end


def tutorial
  @user = User.find(params[:id])
end



private

def user_params
  params.require(:user).permit(:id, :first_name, :last_name, :email, :born_in, :gender, :password, :password_confirmation)
end


    def product_params
      params.require(:product).permit(:slug, :name, :description, :price, :releasing_on, :website, :company, :image, :image_content_type, category_ids: [])
    end

  def require_correct_user
    @user = User.find(params[:id])
      redirect_to "/products/filter/trending" unless current_user? (@user)
    end

  def require_correct_user_admin
    @user = User.find(params[:id])
     redirect_to "/products/filter/trending" unless current_user_admin? (@user)
    end


def subscribe
  @user = User.find(params[:id])
  @user.subscribe_to_mailchimp(true)
  # redirect to some other url
end


      def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "releasing_on"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end