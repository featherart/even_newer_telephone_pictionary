class DropTurn < ActiveRecord::Migration
  def change
  	drop_table :turns
  end
end
