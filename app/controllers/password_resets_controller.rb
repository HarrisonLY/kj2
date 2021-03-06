class PasswordResetsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end



  def create
  user = User.find_by_email(params[:email].downcase)
  user.send_password_reset if user
  redirect_to :back, alert: "If the email existed, an email was sent to you with password reset instructions."
  end


def edit
  @user = User.find_by_password_reset_token!(params[:id])
end

def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path, alert: "Password reset has expired."
elsif @user.update_attributes(params.permit![:user])
    redirect_to signin_url, notice: "Password has been reset!"
  else
    render :edit
  end
end

end