Rails.application.routes.draw do
  
  resources :fruits, defaults: {format: :json}

  # get 'fruits/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'fruits' => 'fruits#index'

  # get 'fruits/:id' => 'fruits#show'

end