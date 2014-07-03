Rails.application.routes.draw do

  root "static_pages#home"

  get "/customers/login", to: "customers#login"
  post "/customers/login_user", to: "customers#login_user"

  resources :attractions
  
  resources :customers do
    resources :attractions
  end

end