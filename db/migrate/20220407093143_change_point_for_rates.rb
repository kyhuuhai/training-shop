class ChangePointForRates < ActiveRecord::Migration[6.0]
  def change
    change_column_default :rates, :point, 0
  end
end
