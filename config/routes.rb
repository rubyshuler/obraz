Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/home'

  devise_for :users

  resources :orders
  resources :shopping_carts

  resources :messages

  resources :looks do
    resource :favorite, only: [:create, :destroy]
  end

  resources :items do
    resource :favorite, only: [:create, :destroy]
    member do
      patch :add_to_order
    end
  end

  resources :messages, only: [:create, :index, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
