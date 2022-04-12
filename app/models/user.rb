class User < ActiveRecord::Base
  has_many :rates
  has_many :comments
  has_many :orders
  has_many :images, as: :imageable
end
