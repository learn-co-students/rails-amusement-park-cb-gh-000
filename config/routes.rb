Rails.application.routes.draw do

  # roots
  root "static_pages#home"

  # rides
  post "/rides/new", to: "rides#new"

  resources :attractions

  resources :users

end