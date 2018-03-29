Rails.application.routes.draw do

  root 'static#home'
  resources :users
  get '/signin', to: 'sessions#new'
  resources :sessions, except: [:new]
  resources :attractions
  post '/rides/new', to: 'rides#new'

end
