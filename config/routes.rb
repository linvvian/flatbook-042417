Rails.application.routes.draw do

  root 'application#index'
  resources :users
  resources :groups
  resources :events
  resources :projects
  resources :cohorts
  resources :friendships, only: :create
  get '/friends' => 'friendships#show', as: 'show_friends'

  post '/group/:id' => 'groups#join_group', as: 'join_group'
  delete '/group/:id' => 'groups#leave_group', as: 'leave_group'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
