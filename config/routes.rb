Rails.application.routes.draw do
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
  post 'auth_user' => 'authentication#authenticate_user'
end
