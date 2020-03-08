class Order < ApplicationRecord
  enum status: [:in_progress]

  belongs_to :customer
  has_many :designers, through: :items
  has_many :items

  has_many :messages, dependent: :destroy

  belongs_to :shopping_cart
end
