class FixTurnName < ActiveRecord::Migration
  def change
    remove_column :users, :turn
    add_column :users, :turn_number, :integer
  end

  
end
