Rails.application.routes.draw do
  
  devise_for :users
  resources :users
  resources :lists


  root to: 'welcome#index'
end
