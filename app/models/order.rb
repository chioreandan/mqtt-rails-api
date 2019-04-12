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
