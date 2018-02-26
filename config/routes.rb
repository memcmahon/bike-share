  Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :conditions, only: [:index, :show]
  resources :trips, only: [:index, :show]
  resources :stations, param: :slug
  resources :accessories, path: 'bike-shop', only: [:index, :show]
  resources :orders, only: [:create, :show]
  resources :users, except: [:index, :show], shallow: :true

  namespace :admin do
    resources :orders, only: [:show, :update]
    resources :conditions, except: [:index, :show]
    resources :trips, except: [:index, :show]
    resources :stations, except: [:index, :show]
    resources :accessories, path: 'bike-shop', except: [:show]
  end

  resources :cart, only: [:index, :create] do
    collection do
      post 'increase'
      post 'decrease'
      post 'remove'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/admin/dashboard', to: 'admin/users#show'
  get '/dashboard', to: 'users#show'
  get '/stations-dashboard', to: 'stations_dashboard#index'
  get '/trips-dashboard', to: 'trips_dashboard#index'
  get '/weather-dashboard', to: 'conditions_dashboard#index'

end
