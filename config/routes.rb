Rails.application.routes.draw do

  root 'application#index'
  resources :users, except: :index
  resources :groups
  resources :events
  resources :projects
  resources :cohorts

  post '/groups/:id/join' => 'groups_users#join_group', as: 'join_group'
  delete '/groups/:id/leave' => 'groups_users#leave_group', as: 'leave_group'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  post '/projects/:id/add_comment' => 'comments#add_comment'
end
