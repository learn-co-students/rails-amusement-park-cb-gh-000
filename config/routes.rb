Rails.application.routes.draw do

  # roots
  root "static_pages#home"

  # login/signup
  get "/customers/login", to: "customers#login"
  post "/customers/login_user", to: "customers#login_user"

  resources :customers do
    resources :attractions
  end

end