Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:update, :show, :index]
  resources :items do
    patch 'toggle' => 'items#toggle', as: :toggle
  end  

  root to: 'items#index'

end
