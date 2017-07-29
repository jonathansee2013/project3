class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: true, length: {minimum: 5}
  validates :username, presence: true
end
