class AddTimestampsStoryline < ActiveRecord::Migration
  def change
    remove_column :storylines, :turn
    add_column :storylines, :time_stop, :timestamp
    add_column :storylines, :active, :boolean
    add_column :users, :storyline_id, :integer
  end
end
