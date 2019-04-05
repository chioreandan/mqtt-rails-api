# frozen_string_literal: true

class AuthController < BaseController
  before_action :doorkeeper_authorize!

  private

    def current_app_user
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
end
