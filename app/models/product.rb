class Product < ActiveRecord::Base
  has_many :images, as: :imageable
  has_many :comments, as: :commentable
end
