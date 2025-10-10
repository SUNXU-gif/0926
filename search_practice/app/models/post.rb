class Post < ApplicationRecord
  belongs_to :user

  # 允许被 Ransack 搜索的字段
  def self.ransackable_attributes(_auth_object = nil)
    %w[title content]  # 需要哪些就列哪些
  end

  # 允许的关联（这次其实不用，但写上更安全）
  def self.ransackable_associations(_auth_object = nil)
    %w[user]
  end
end
