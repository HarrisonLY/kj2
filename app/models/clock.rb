class Clock < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
end
