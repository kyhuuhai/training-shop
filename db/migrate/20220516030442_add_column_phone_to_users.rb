class AddColumnPhoneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :numeric, limit: 10
  end
end
