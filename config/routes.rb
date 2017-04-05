Rails.application.routes.draw do
  get 'work_kanri/index'

  get 'work_kanri/show'

  get 'work_kanri/new'

  get 'work_kanri/edit'

  resources :users
  root to: 'users#index'

  #sessions controller
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  
end
