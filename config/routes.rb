Rails.application.routes.draw do
  root 'sessions#new'

  post "/rides/new", to: "rides#new"

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  resources :attractions
  resources :users
  resources :sessions
end
