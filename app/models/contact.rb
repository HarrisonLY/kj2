class Contact < MailForm::Base

ActionMailer::Base.smtp_settings = {
    :port =>           '587',
    :address =>        'smtp.mandrillapp.com',
    :user_name =>      ENV['MANDRILL_USERNAME'],
    :password =>       ENV['MANDRILL_APIKEY'],
    :domain =>         'kijovodemo.herokuapp.com',
    :authentication => :plain
}
ActionMailer::Base.delivery_method = :smtp


  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Help | Kijovo Contact Form",
      :to => "info@kijovo.com",
      :from => %("#{name}" <#{email}>)
    }
  end


  
end


