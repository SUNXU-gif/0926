class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  validates :name, presence: true

  # 允许被 Ransack 搜索的字段（我们只搜索 name）
  def self.ransackable_attributes(_auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(_auth_object = nil)
    []  # 不需要关联搜索就留空
  end
end
