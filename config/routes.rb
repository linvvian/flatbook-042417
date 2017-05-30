Rails.application.routes.draw do
  root 'application#index'
  resources :user
  resources :group
  resources :event
  resources :project
  resources :cohort
  resources :session, only: [:create, :destroy]
end
