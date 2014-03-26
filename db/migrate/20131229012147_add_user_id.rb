class AddUserId < ActiveRecord::Migration
  def change
    add_column :phrases, :user_id, :integer
    add_column :pictures, :user_id, :integer
  end
end
