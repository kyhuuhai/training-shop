class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment_method
  has_many :order_details
end
