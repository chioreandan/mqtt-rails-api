class CreateSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :sensors do |t|
      t.references :user, foreign_key: true
      t.string :topic
      t.string :name
      t.string :type
      t.string :room

      t.timestamps
    end
  end
end
