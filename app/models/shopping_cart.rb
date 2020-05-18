class ShoppingCart < ApplicationRecord
  has_one :user

  has_many :items_orders
  has_many :items, through: :items_orders
end
