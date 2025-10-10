class User < ApplicationRecord
  has_secure_password   # bcrypt 提供的功能

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
