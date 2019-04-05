# frozen_string_literal: true

require 'mqtt'

MQTT::Client.connect('serverboi.cf', 9001) do |c|
  c.get('smarthome/livingroom/light') do |topic, message|
    puts "#{topic}: #{message}"
  end
end

