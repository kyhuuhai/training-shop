class ChangeStatusForOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :status, :integer, using: "status::integer"
  end
end
