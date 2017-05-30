Rails.application.routes.draw do

  root 'application#index'
  resources :users, except: :index
  resources :groups
  resources :events
  resources :projects
  resources :cohorts
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
