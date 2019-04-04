Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applications, :authorize_applications
  end
  # namespace :api do
  #   namespace :v1 do
  #     resources :sensors, only: [:index, :show, :new, :create, :destroy]
  #     resources :users do
  #       collection do
  #         post :log_in
  #       end
  #     end
  #   end
  # end
  get 'base' => 'base#index'
end
