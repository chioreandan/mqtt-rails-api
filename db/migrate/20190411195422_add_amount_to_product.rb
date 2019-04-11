class AddAmountToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :amount, :integer, default: 1
  end
end
