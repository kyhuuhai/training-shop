class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity, default: 1
      t.float :unit_price, default: 0
      t.float :total_price, default: 0
      t.timestamps
    end
  end
end
