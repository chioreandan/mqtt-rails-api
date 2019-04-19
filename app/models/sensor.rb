# frozen_string_literal: true

# == Schema Information
#
# Table name: sensors
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  room       :string
#  topic      :string
#  var_type   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_sensors_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#


class Sensor < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
