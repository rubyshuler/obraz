Rails.application.routes.draw do

  root 'pages#home'
  get 'pages/home'
  get 'orders/order_added', to: "orders#order_added"

  devise_for :users, controllers: { registrations: "users/registrations"}

  resources :orders
  resources :shopping_carts

  resources :messages
  resources :users
  resources :designers do
    get 'orders'
  end

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
end
