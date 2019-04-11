require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"
require "mqtt"

Bundler.require(*Rails.groups)

module MqttServer
  class Application < Rails::Application
    config.load_defaults 5.2

    config.eager_load_paths += %W[
      #{config.root}/lib
    ]

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 headers: :any,
                 methods: [:get, :post, :options, :delete, :put]
      end
    end

    config.api_only = true
  end
end
