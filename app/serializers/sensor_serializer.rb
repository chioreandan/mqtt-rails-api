class SensorSerializer < ActiveModel::Serializer
  attributes :id, :topic,:name, :room, :user
end
