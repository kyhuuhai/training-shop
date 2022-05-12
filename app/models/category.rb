class Category < ActiveRecord::Base
  has_many :category_products, dependent: :destroy
  has_many :products, through: :category_products
end
