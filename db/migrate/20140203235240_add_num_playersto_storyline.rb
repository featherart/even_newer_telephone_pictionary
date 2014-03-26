class AddNumPlayerstoStoryline < ActiveRecord::Migration
  def change
    add_column :storylines, :num_players, :integer 
  end

end
