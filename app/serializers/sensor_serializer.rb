class SensorSerializer < ActiveModel::Serializer
  attributes :id, :topic,:name, :room

  # has_one :user
end
