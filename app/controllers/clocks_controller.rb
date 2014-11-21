class ClocksController < ApplicationController
	before_action :require_signin
  before_action :set_product
respond_to :html, :js

def create

	@product.clocks.create!(user: current_user)  

redirect_to(:back)
end

def destroy

  clock = current_user.clocks.find(params[:id])

  clock.destroy
  redirect_to(:back)
end




private 

  def set_product
    @product = Product.find_by!(slug: params[:product_id])
  end

end