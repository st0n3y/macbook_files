Rails.application.routes.draw do
  
  get 'completed_tasks/index'

  get 'tasks/index'

  resources :students, defaults: { format: 'json' }

  resources :tasks, defaults: { format: 'json' }

  resources :completed_tasks, defaults: { format: 'json' }

end