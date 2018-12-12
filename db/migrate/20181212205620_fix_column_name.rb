class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :sensors, :type, :var_type
  end
end
