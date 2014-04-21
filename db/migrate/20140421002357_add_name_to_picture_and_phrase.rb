class AddNameToPictureAndPhrase < ActiveRecord::Migration
  def change
    add_column :pictures, :name, :string
    add_column :phrases, :name, :string
  end
end
