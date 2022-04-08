class Image < ApplicationRecord
  belongs_to :product, polymorphic: true
  belongs_to :user, polymorphic: true
end
