Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applications, :authorize_applications
  end
  namespace :api do
    namespace :v1 do
      devise_for :users,  controllers: { registrations: 'api/v1/registrations' }
      resources :sensors, only: [:index, :show, :new, :create, :destroy]
    end
  end
end
