class AddAcceptedtoPlayer < ActiveRecord::Migration
  def change
    add_column :players, :joined, :boolean
    add_column :players, :time_start, :timestamp
    remove_column :players, :phone
    add_column :players, :phone_number, :string
  end
end
