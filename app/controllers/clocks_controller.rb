class ClocksController < ApplicationController
	before_action :require_signin
#	before_action :set_product
  respond_to :html, :js

def create
  @product = Product.find_by!(slug: params[:product_id]) 
	@product.clocks.create!(user: current_user)  

   respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end
end

def destroy
  @product = Product.find_by!(slug: params[:product_id])
  clock = current_user.clocks.find(params[:id])

  clock.destroy
   respond_to do |format|
      format.html { redirect_to(:back) }
      format.js
    end
end




private 

#  def set_product
#    @product = Product.find_by!(slug: params[:product_id])
#  end

end