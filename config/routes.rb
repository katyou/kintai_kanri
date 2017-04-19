Rails.application.routes.draw do
  #add kalender app
  resources :users do
    resources :work_times, only: [:index, :show, :new, :edit] do
      collection do
        get 'get_next_month'
        get 'get_prev_month'
      end
    end
  end

  root to: 'work_times#index'

  #sessions controller
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


end
