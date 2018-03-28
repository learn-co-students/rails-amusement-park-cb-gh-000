Rails.application.routes.draw do

  root 'static#home'
  resources :users
  get '/signin', to: 'sessions#new'
  resources :sessions, except: [:new]

end
