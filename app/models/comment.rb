class Comment < ApplicationRecord
  belongs_to :user
  has_many :rates, as: :rateable
end
