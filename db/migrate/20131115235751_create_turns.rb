class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :turn_number
      t.integer :user_id

      t.timestamps
    end
  end
end
