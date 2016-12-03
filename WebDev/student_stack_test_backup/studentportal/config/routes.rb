Rails.application.routes.draw do

  root to: 'site#index'

  # The routing for the controller has to consider the fact that it’s within two namespaces; API and V1. We’ll do this using the namespace method.

  namespace :api do
    namespace :v1 do
      resources :students, only: [:index, :create, :destroy, :update]
    end
  end

end