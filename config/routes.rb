Rails.application.routes.draw do
  root 'pages#landing'
  get '/home', to: 'pages#home'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :folders
end
