Rails.application.routes.draw do

  root 'application#index'
  resources :users, except: :index
  resources :groups
  resources :events
  resources :projects
  resources :cohorts

  post '/groups/:id/join' => 'groups_users#join_group', as: 'join_group'
  delete '/groups/:id/leave' => 'groups_users#leave_group', as: 'leave_group'

  post '/events/:id/join' => 'events_users#join_event', as: 'join_event'
  delete '/events/:id/leave' => 'events_users#leave_event', as: 'leave_event'

  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
