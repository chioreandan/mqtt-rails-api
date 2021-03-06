# frozen_string_literal: true
# == Schema Information
#
# Table name: orders
#
#  id          :bigint(8)        not null, primary key
#  end_date    :datetime
#  returned    :boolean          default(FALSE)
#  returned_at :datetime
#  start_date  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :time_until_end, :returned, :returned_at

  belongs_to :user
  belongs_to :products
end
