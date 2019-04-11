# frozen_string_literal: true

Devise.setup do |config|
  # config.secret_key = '62b4e60cbd5ee0922da5f1f0c24b834dca4b0a4a0012ce6c5c68667e916409de525ce41024fa17bd9c8208f089e1cd04b47ae45b30216fc2baa5bb04e0cb8599'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
