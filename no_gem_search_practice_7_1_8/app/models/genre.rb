class Genre < ApplicationRecord
  has_many :cookings, dependent: :destroy
end
