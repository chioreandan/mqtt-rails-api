class AddReturnedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :returned, :boolean
  end
end
