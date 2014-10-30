class ClocksController < ApplicationController
	before_action :require_signin
	before_action :set_product

def create
	@product.clocks.create!(user: current_user)  
	redirect_to @product
  #if @product
  #  redirect_to @product
  #else redirect_to products_url
#end
end

def destroy
  clock = current_user.clocks.find(params[:id])
  clock.destroy
  redirect_to @product
end



private 

  def set_product
    @product = Product.find_by!(slug: params[:product_id])
  end

end