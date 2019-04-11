# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[customer admin]

  has_one :card
  has_many :sensors
  has_many :orders
end
