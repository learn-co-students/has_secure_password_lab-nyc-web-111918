Rails.application.routes.draw do
  
  root 'application#hello'
  get '/login' => 'sessions#new', as: :login
  get '/users' => 'users#new', as: :new_user

  post '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#create'

  resources :users
end
