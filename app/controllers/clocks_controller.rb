class ClocksController < ApplicationController
	before_action :require_signin
    before_action :set_product
    respond_to :html, :js

def create

	@product.clocks.create!(user: current_user)  

      respond_to do |format|
      format.html { redirect_to :back }
      format.js
end
end

def destroy

  clock = current_user.clocks.find(params[:id])

  clock.destroy
      respond_to do |format|
      format.html { redirect_to :back }
      format.js
end
end



private 

  def set_product
    @product = Product.find_by!(slug: params[:product_id])
  end

def released
  user = User.find_by_email(params[:email])
  user.send.clock_release if user.clocked.product.out?
end

end


