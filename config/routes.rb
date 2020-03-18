Rails.application.routes.draw do
  resources :shopping_carts
  root to: 'items#index'
  # root to: 'pages/index'
  devise_for :users

  resources :orders

  resources :messages
  resources :announcements
  resources :designers
  resources :customers

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
