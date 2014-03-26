class CreateStorylines < ActiveRecord::Migration
  def change
    create_table :storylines do |t|
      t.integer :picture_id
      t.integer :phrase_id
      t.integer :turn
      t.integer :user_id

      t.timestamps
    end
  end
end
