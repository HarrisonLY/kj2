class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update]
  before_action :require_admin, only: [:index, :destroy]

def index
  @users = User.all

end

def show
  @user = User.find(params[:id])
  @clocked_products = @user.clocked_products  
  #if current_user
  #@current_clock = current_user.clocks.find_by(product_id: @product.id)
  #end
end


def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to @user
  else
    render :new
  end 
end

def edit
end

def update
  if @user.update(user_params)
    redirect_to @user
  else
    render :edit
  end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to root_url, alert: "Account successfully deleted!"
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :born_in, :gender, :password, :password_confirmation)
end

  def require_correct_user
    @user = User.find(params[:id])
      redirect_to products_url unless current_user? (@user)
    end

end