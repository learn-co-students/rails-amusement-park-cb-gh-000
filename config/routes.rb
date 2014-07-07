Rails.application.routes.draw do

  # roots
  root "static_pages#home"

  # owners
  get "/owners/login", to: "owners#login"
  post "/owners/login_user", to: "owners#login_user"
  get "/owners/:id", to: "owners#show"
  
  # rides
  post "/customers/:id/attractions/:id/rides/new", to: "rides#new"

  # login/signup customers
  get "/customers/login", to: "customers#login"
  post "/customers/login_user", to: "customers#login_user"

  resources :attractions

  resources :customers do
    resources :attractions, only: [:index, :show]
  end

end