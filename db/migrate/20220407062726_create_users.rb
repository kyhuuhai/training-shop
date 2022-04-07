class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean :is_admin
      t.string :name
      t.string :email
      t.text :address
      t.string :password
      t.string :password_digest
      t.string :remember_digest

      t.timestamps
    end
  end
end
