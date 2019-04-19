# == Schema Information
#
# Table name: cards
#
#  id              :bigint(8)        not null, primary key
#  password_digest :string
#  uid             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint(8)
#
# Indexes
#
#  index_cards_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Card < ApplicationRecord
  has_secure_password
  belongs_to :user
end
