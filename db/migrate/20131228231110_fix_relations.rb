class FixRelations < ActiveRecord::Migration
  def change
    remove_column :storylines, :picture_id
    remove_column :storylines, :phrase_id
    remove_column :players, :turn_number
    remove_column :players, :storyline_id
    remove_column :players, :joined
    remove_column :players, :time_start 
    add_column :pictures, :storyline_id, :integer
    add_column :phrases, :storyline_id, :integer
  end
end
