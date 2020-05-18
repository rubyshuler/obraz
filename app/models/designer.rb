class Designer < ApplicationRecord
  enum role: [:designer, :stylist]

  belongs_to :user
  has_many :items

  has_many :orders
  # has_many :items_orders
  # has_many :orders, through: :items_orders
  accepts_nested_attributes_for :orders

  has_one_attached :image
end
