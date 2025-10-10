class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  validates :title, presence: true
end
