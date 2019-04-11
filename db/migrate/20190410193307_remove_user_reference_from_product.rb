class RemoveUserReferenceFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :products, column: :user_id
  end
end
