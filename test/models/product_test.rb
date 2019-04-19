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

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
