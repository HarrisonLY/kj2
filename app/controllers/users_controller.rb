class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update]
  before_action :require_admin, only: [:index, :destroy]

def index
  @users = User.all

end


  helper_method :sort_column, :sort_direction
def show
  @user = User.find(params[:id])
#  @product = Product.find(params[:id])
  @clocked_products = @user.clocked_products.order(sort_column + " " + sort_direction)
  

   if current_user
 #     @current_clock = current_user.clocks.find_by(product_id: @product)
 #     @current_clock = current_user.clocks.find_by(product_id: @product.id)
      @current_clock = current_user.clocks.find_by(user_id: @user.id)
   end
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

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :born_in, :gender, :password, :password_confirmation)
end


    def product_params
      params.require(:product).permit(:slug, :name, :description, :price, :releasing_on, :website, :company, :image, :image_content_type, :total_clocks, category_ids: [])
    end

  def require_correct_user
    @user = User.find(params[:id])
      redirect_to products_url unless current_user? (@user)
    end

      def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "releasing_on"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end