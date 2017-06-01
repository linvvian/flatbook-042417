Rails.application.routes.draw do

  root 'application#index'
  resources :users
  resources :groups
  resources :events
  resources :projects
  resources :cohorts
  resources :friendships, only: [:create, :destroy]

  get '/friends' => 'friendships#show', as: 'show_friends'

  post '/groups/:id/join' => 'groups_users#join_group', as: 'join_group'
  delete '/groups/:id/leave' => 'groups_users#leave_group', as: 'leave_group'

  post '/events/:id/join' => 'events_users#join_event', as: 'join_event'
  delete '/events/:id/leave' => 'events_users#leave_event', as: 'leave_event'

  post '/login' => 'sessions#create'
  get 'auth/:provider/callback', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/projects/:id/add_comment' => 'comments#add_comment'
  post '/users/:id/add_comment' => 'comments#add_comment'
  post '/events/:id/add_comment' => 'comments#add_comment'
  post '/groups/:id/add_comment' => 'comments#add_comment'

  delete '/projects/:id/delete_comment' => 'comments#delete_comment'
  delete '/users/:id/delete_comment' => 'comments#delete_comment'
  delete '/events/:id/delete_comment' => 'comments#delete_comment'
  delete '/groups/:id/delete_comment' => 'comments#delete_comment'

  post '/projects/:id/like' => 'thumbs#like_comment'
  post '/users/:id/like' => 'thumbs#like_comment'
  post '/events/:id/like' => 'thumbs#like_comment'
  post '/groups/:id/like' => 'thumbs#like_comment'

  post '/projects/:id/dislike' => 'thumbs#dislike_comment'
  post '/users/:id/dislike' => 'thumbs#dislike_comment'
  post '/events/:id/dislike' => 'thumbs#dislike_comment'
  post '/groups/:id/dislike' => 'thumbs#dislike_comment'


end
