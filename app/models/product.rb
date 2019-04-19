# == Schema Information
#
# Table name: products
#
#  id         :bigint(8)        not null, primary key
#  amount     :integer          default(1)
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#

class Product < ApplicationRecord
  has_and_belongs_to_many :orders
end
