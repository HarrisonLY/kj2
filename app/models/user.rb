class User < ActiveRecord::Base
    has_many :clocks, dependent: :destroy
    has_many :clocked_products, through: :clocks, source: :product

  has_secure_password

validates :first_name, presence: true
validates :last_name, presence: true
validates :password, length: { minimum: 4, allow_blank: true }

validates :gender, presence: true
validates :born_in, presence: true

validates :email, presence: true,                   
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }


def self.authenticate(email, password)
  user = User.find_by(email: email)
  user && user.authenticate(password)
end


end
