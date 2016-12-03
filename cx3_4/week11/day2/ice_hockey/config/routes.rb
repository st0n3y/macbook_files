Rails.application.routes.draw do

  resources :stadia

  resources :teams do
    resources :players
    resources :matches
  end

end