class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :doorkeeper_authorize!
  respond_to :json

  protected

  def configure_permitted_parameters
    added_attrs = [:email, :first_name, :last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
