class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, uniqueness: { scope: :post_id } # 一个用户对同一帖子只能点一次
end
