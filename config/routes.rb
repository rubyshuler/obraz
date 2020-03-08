Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users

  resources :shopping_carts
  resources :messages
  resources :orders
  resources :announcements
  resources :designers
  resources :customers

  resources :looks do
    resource :favorite, only: [:create, :destroy]
  end

  resources :items do
    resource :favorite, only: [:create, :destroy]
  end

  resources :messages, only: [:create, :index, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
