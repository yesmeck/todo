class User < ActiveRecord::Base
  has_secure_password

  has_many :todos, -> { order(:completed, :id) }

  validates :email, uniqueness: true
end
