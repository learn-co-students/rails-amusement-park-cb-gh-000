Rails.application.routes.draw do

  # roots
  root "static_pages#home"

  # sessions
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  # rides
  post "/rides/new", to: "rides#new"

  resources :attractions

  resources :users

end