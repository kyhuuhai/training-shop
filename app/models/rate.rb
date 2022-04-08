class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :comment, polymorphic: true
  belongs_to :product, polymorphic: true
end
