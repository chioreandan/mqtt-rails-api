class AddReturnedAtToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :returned_at, :datetime
  end
end
