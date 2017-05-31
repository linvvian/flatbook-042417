Rails.application.routes.draw do

  root 'application#index'
  resources :users, except: :index
  resources :groups
  resources :events
  resources :projects
  resources :cohorts

  post '/group/:id' => 'groups#join_group', as: 'join_group'
  delete '/group/:id' => 'groups#leave_group', as: 'leave_group'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
