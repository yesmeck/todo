class User < ActiveRecord::Base
  has_secure_password

  has_many :todos

  validates :email, uniqueness: true
end
