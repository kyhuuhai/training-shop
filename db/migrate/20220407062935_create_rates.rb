class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true
      t.string :rateable_id
      t.string :rateable_type
      t.float :point

      t.timestamps
    end
  end
end
