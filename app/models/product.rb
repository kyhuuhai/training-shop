class Product < ActiveRecord::Base
  has_many_attached :images
  belongs_to :order_detail
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products

  validates :code, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true

  scope :ordered_by_name, -> { order(name: :desc) }
  scope :ordered_by_price, -> { order(name: :desc) }
  scope :search_name, ->(name) { where("name LIKE ?", "%#{name}%") if name.present? }
  scope :search_category, ->(category_ids) { where(category_ids: category_ids) if category_ids.present? }
  scope :search_product, lambda { |params|
    search_name(params[:name])
      .search_category(params[:category_ids])
  }
end
