class Post < ApplicationRecord
  belongs_to :user


  def self.ransackable_attributes(auth_object = nil)
    %w[title content]
  end
end
