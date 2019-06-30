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

class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products

  def time_until_end
    unless end_date.nil?
      time_diff = (end_date - Time.zone.now).round.abs
      hours = time_diff / 3600

      dt = DateTime.strptime(time_diff.to_s, '%s').utc
      "#{hours}:#{dt.strftime "%M:%S"}"
    end
  end
end
