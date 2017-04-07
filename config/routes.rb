Rails.application.routes.draw do
  resources :users
  root to: 'users#index'

  resources :work_times, only: [:index] do
    collection do
      get 'get_next_month'
      get 'get_prev_month'
    end
  end


  #sessions controller
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
