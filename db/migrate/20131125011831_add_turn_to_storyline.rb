class AddTurnToStoryline < ActiveRecord::Migration
  def change
  	#add_column :storylines, :turn, :integer
  	remove_column :pictures, :turn
  	remove_column :phrases, :turn
  end
end
