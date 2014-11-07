class ClocksController < ApplicationController
	before_action :require_signin
#	before_action :set_product

def create
  @product = Product.find_by!(slug: params[:product_id]) 
	@product.clocks.create!(user: current_user)  

	redirect_to(:back)
end

def destroy
  @product = Product.find_by!(slug: params[:product_id])
  clock = current_user.clocks.find(params[:id])

  clock.destroy
  redirect_to(:back)
end




private 

#  def set_product
#    @product = Product.find_by!(slug: params[:product_id])
#  end

end