class User < ActiveRecord::Base
  before_create { generate_token(:auth_token) }
	after_create :subscribe_to_mailchimp


    has_many :clocks, dependent: :destroy
    has_many :clocked_products, through: :clocks, source: :product

  has_secure_password

validates :first_name, presence: true
validates :last_name, presence: true
validates :password, length: { minimum: 3, allow_blank: true }

#validates :gender, presence: true
#validates :born_in, presence: true

validates :email, presence: true,                   
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }


def self.authenticate(email, password)
  user = User.find_by(email: email)
  user && user.authenticate(password)
end


def subscribe_to_mailchimp(optin = false)
    response = $mailchimp.lists.subscribe({
       id: '4129fa18e2',
	   :email => {:email => self.email}, 
	   :merge_vars => {:FNAME => self.first_name, :LNAME => self.last_name},
       double_optin: optin,
    })
end

def unsubscribe_from_mailchimp(notify = false)
    response = $mailchimp.lists.unsubscribe({
       id: '4129fa18e2',
       email: {email: self.email},
       :delete_member => false, 
       :send_notify => notify
    })
end

#    def subscribe_to_list
 #       Resque.enqueue(MailchimpSubscriber, self.id)
#    end

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver 
end

def send_clock_release

end 

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name

    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save(:validate => false)  
  end
end


  def self.create_with_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email

    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save(:validate => false)  
    end
  end


#  def self.from_omniauth(auth)
#    where(provider: auth.provider, uid: auth.uid).first_or_create.tap do |user|
#      user.provider ||= auth.provider 
#      user.uid = auth.uid
#      user.name = auth.info.name
#      user.save
#    end
#  end

end
