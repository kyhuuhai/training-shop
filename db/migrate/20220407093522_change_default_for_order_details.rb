class ChangeDefaultForOrderDetails < ActiveRecord::Migration[6.0]
  def change
    change_column_default :order_details, :quantity, 1
    change_column_default :order_details, :price, 0
  end
end
