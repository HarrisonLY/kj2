class UserMailer < ActionMailer::Base
  default from: "info@kijovo.com"

ActionMailer::Base.smtp_settings = {
    :port =>           '587',
    :address =>        'smtp.mandrillapp.com',
    :user_name =>      'info@kijovo.com',
    :password =>       'ZN98hCVbNPkI9vwxGClx8Q',
    :domain =>         'kijovo.com',
    :authentication => :plain
}
ActionMailer::Base.delivery_method = :smtp

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
def password_reset(user)
  @user = user
    mail(to: @user.email, subject: 'Password Reset')
end

#def clock_release(user product clock)
#  @user = user
#  email_with_name = "#{@user.first_name} <#{@user.email}>"
#  mail(to: email_with_name, subject: 'Sneakers Releasing Today')
#end

end