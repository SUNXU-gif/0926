class User < ApplicationRecord
  devise :database_authenticatable, :registerable   # 去掉 :validatable

  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password, allow_nil: true, length: { minimum: 6 }, on: :update
  validates :email, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }, if: -> { email.present? }
end
