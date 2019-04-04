# frozen_string_literal: true

class Sensor < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
