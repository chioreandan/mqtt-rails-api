class AddDefaultValueToReturned < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :returned, :boolean, default: false
  end
end
