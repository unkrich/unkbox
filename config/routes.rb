Rails.application.routes.draw do
  # Main user-facing routes
  root 'pages#landing'
  get '/home', to: 'pages#home'
  get '/home/*path', :controller => 'pages', :action => 'home'

  # devise sign up/in
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # folder/file routes
  resources :folders
  get '/folders/:id/files/:folder_id', to: 'folders#destroy_file'
end
