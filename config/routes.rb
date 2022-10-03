Rails.application.routes.draw do
  resources :users
  resources :tasks
  root 'users#index'
end
