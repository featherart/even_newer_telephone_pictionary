class AddNameToStoryline < ActiveRecord::Migration
  def change
    add_column :storylines, :story_name, :string
  end
end
