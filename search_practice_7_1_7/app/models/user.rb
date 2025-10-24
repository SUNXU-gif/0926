class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password

  def self.ransackable_attributes(auth_object = nil)
    %w[name email]
  end
end
