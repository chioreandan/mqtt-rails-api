Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sensors
      resources :users
    end
  end
end
