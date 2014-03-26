class AddTurnToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :turn, :integer
  	add_column :phrases, :turn, :integer
  end
end
