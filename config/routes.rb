Rails.application.routes.draw do

  root 'application#index'
  resources :users, except: :index
  resources :groups
  resources :event
  resources :project
  resources :cohort
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :session, only: [:create, :destroy]
end
