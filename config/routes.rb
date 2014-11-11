Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update, :show, :index]

  resource :list do
  	resources :items, only: [:index, :new, :create, :destroy]
  end

  match '/list/new', :to => 'lists#new', via: 'get'

  root to: 'welcome#index'
end
