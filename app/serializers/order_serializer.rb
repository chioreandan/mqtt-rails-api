# frozen_string_literal: true

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :time_until_end

  belongs_to :user
  belongs_to :products
end
