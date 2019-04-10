class ChangeRfidColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :rfid, :code
  end
end
