class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :image

      t.timestamps
    end
  end
end
