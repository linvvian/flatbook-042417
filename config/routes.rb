Rails.application.routes.draw do

  root 'application#index'
  resources :users
  resources :groups
  resources :events
  resources :projects
  resources :cohorts
  resources :friendships, only: [:create, :destroy, :update]
  resources :comments, only: [:create, :destroy]
  resources :thumbs, only: [:create, :destroy]

  get '/friends' => 'friendships#show', as: 'show_friends'

  post '/groups/:id/join' => 'groups_users#join_group', as: 'join_group'
  delete '/groups/:id/leave' => 'groups_users#leave_group', as: 'leave_group'

  post '/events/:id/join' => 'events_users#join_event', as: 'join_event'
  delete '/events/:id/leave' => 'events_users#leave_event', as: 'leave_event'

  post '/login' => 'sessions#create'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
