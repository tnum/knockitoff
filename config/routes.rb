Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update, :show, :index]
  resources :items, only: [:new, :create, :index]

  root to: 'items#index'
end
