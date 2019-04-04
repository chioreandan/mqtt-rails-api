Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applications, :authorize_applications
  end
  namespace :api do
    namespace :v1 do
      resources :sensors, only: [:index, :show, :new, :create, :destroy]
    end
  end
  devise_for :users,  controllers: { registrations: 'api/v1/registrations' }

  get 'base' => 'base#index'
end
