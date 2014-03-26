class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :turn_number
      t.integer :storyline_id

      t.timestamps
    end
  end
end
