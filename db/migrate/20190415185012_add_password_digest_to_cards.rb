class AddPasswordDigestToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :password_digest, :string
  end
end
