Rails.application.routes.draw do
  
  resources :students, defaults: { format: 'json' }

end