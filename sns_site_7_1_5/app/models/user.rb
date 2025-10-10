class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
end
