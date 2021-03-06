# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applications, :authorize_applications
  end

  namespace :api do
    namespace :v1 do
      devise_for :users,  controllers: { registrations: 'api/v1/registrations' }
      resources :sensors, only: [:index, :show, :new, :create, :destroy]
      resources :orders, only: [:index, :show, :new, :create, :destroy, :update] do
        member do
          post :return_order
        end
        collection do
          get :returned
          get :not_returned
        end
      end
      resources :products, only: [:index, :show, :new, :create, :destroy, :update]
      resources :cards, only: [:create] do
        collection do
          get :log_in
        end
      end
    end
  end
end
