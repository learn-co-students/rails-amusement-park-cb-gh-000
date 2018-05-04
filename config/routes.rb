Rails.application.routes.draw do
  root 'application#home'
  get '/signin' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :attractions
  resources :rides, only: [:create]
end
