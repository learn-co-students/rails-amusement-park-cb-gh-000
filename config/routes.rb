Rails.application.routes.draw do
  root 'static#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  post '/rides', to: 'rides#create'
  resources :users
  resources :attractions
end