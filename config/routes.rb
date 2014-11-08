Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update, :show, :index]
  resource :list do
  	resources :items
  end

  root to: 'welcome#index'
end
