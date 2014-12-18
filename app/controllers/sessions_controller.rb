class SessionsController < ApplicationController


  def new
    if current_user
      redirect_to "/products/filter/trending"
    end
  end

  def create
    if auth = request.env["omniauth.auth"]
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
        if user.created_at.to_s > (Time.now - 30.seconds)
          redirect_to users_tutorial_url (@user)
        else
          redirect_to(session[:intended_url] || filtered_products_path(:trending))
        end
      session[:intended_url] = nil
    elsif 
      user = User.authenticate(params[:email].downcase, params[:password])
      session[:user_id] = user.id
      redirect_to(session[:intended_url] || filtered_products_path(:trending))
      session[:intended_url] = nil
    else  
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
  end
end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


private

  def downcase_email
    self.email = email.downcase
  end

end