Rails.application.routes.draw do

  root "attractions#index"
  resources :users
  resources :rides
  resources :attractions

  resources :sessions, only: [:new, :create, :destroy]

  resources :registrations, only: [:new, :create]

  # get '/whatever', to: "sessions#new"
   # get

end