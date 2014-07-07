Rails.application.routes.draw do

  # roots
  root "static_pages#home"

  # sessions
  get "users/signin", to: "users#signin"
  post "users/login", to: "users#login"
  
  # rides
  post "/rides/new", to: "rides#new"

  resources :attractions

  resources :users

end