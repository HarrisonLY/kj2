class WelcomeController < ApplicationController

  def index
    if current_user
      redirect_to products_url
  end
end 

  def about
  end

  def terms
  end

  def contact
  end
  

end
