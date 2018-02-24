  Rails.application.routes.draw do

  root to: 'welcome#index'


  resources :stations, param: :slug

  resources :conditions, only: [:index, :show]

  resources :trips, only: [:index, :show]

  resources :accessories, path: 'bike-shop', only: [:index, :show]

  resources :users, except: [:index, :show], shallow: :true do
    resources :carts
    resources :orders, except: [:destroy, :edit, :update]
  end

  namespace :admin do
    resources :conditions, except: [:index, :show]
    resources :trips, except: [:index, :show]
    resources :stations, except: [:index, :show]
    resources :accessories, path: 'bike-shop', except: [:index, :show]
  end

  resources :carts, only: [:create]
  get '/cart', to: 'carts#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/admin/dashboard', to: 'admin/users#show'
  get '/dashboard', to: 'users#show'
  get '/stations-dashboard', to: 'stations_dashboard#index'
  get '/trips-dashboard', to: 'trips_dashboard#index'
  get '/weather-dashboard', to: 'conditions_dashboard#index'
end
