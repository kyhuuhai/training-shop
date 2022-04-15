class Product < ActiveRecord::Base
  has_many :images, as: :imageable
  has_many :comments, as: :commentable

  default_scope { order(created_at: :desc) }
  scope :ordered_by_name, -> { order(name: :desc) }
  scope :ordered_by_price, -> { order(name: :desc) }
end
