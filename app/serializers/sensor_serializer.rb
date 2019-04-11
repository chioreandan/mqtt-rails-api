# frozen_string_literal: true

class SensorSerializer < ActiveModel::Serializer
  attributes :id, :topic, :name, :room
end
