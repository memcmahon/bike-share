  Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :users, except: [:index, :show], shallow: :true do
    resources :carts
    resources :orders, except: [:destroy, :edit, :update]
  end


  resources :stations, param: :slug

  resources :conditions, only: [:index, :show]

  resources :trips, only: [:index, :show]

  namespace :admin do
    resources :conditions, except: [:index, :show]
    resources :trips, except: [:index, :show]
    resources :stations, except: [:index, :show]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/admin/dashboard', to: 'admin/users#show'
  get '/dashboard', to: 'users#show'
  get '/stations-dashboard', to: 'stations_dashboard#index'
  get '/trips-dashboard', to: 'trips_dashboard#index'
  get '/weather-dashboard', to: 'conditions_dashboard#index'

  get '/bikeshop', to: 'accessories#index'
  get '/admin/bike-shop', to: 'admin/accessories#index'
  get '/admin/bike-shop/new', to: 'admin/accessories#new'
  post '/admin/bike-shop', to: 'admin/accessories#create'
  get '/admin/bike-shop/edit', to: 'admin/accessories#edit'
  patch '/admin/bike-shop', to: 'admin/accessories#update'
end
