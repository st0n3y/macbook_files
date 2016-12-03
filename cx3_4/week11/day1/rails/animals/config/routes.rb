Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'animals' => 'animals#index'
  # For the route 'animals', link to the 'animals' controller and run an 'index' action.

  get 'animals/new' => 'animals#new'

  post 'animals' => 'animals#create'

  get 'gems' => 'gems#index'

end