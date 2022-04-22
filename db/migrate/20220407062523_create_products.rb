class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.text :code
      t.string :name
      t.float :price
      t.text :description
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
