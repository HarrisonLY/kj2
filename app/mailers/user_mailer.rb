class UserMailer < ActionMailer::Base
  default from: "info@kijovo.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
def password_reset(user)
  @user = user
    mail(to: @user.email, subject: 'Password Reset')
end

def clock_release(user)
  @user = user
  email_with_name = "#{@user.first_name} <#{@user.email}>"
  mail(to: email_with_name, subject: 'Sneakers Releasing Tomorrow')
end

end