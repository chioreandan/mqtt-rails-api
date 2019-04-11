# frozen_string_literal: true

Doorkeeper.configure do
  orm :active_record

  resource_owner_authenticator do
    fail "Please configure doorkeeper resource_owner_authenticator block located in #{__FILE__}"
  end

  resource_owner_from_credentials do |routes|
    user = User.find_for_database_authentication(email: params[:email])
    if user && user.valid_for_authentication? { user.valid_password?(params[:password]) }
      user
    end
  end

  access_token_expires_in 30.days

  grant_flows %w(password)

  skip_authorization do
    true
  end
end

