class Order < ApplicationRecord
  enum status: { new_order: 'Новый', in_progress: 'В обработке' }

  belongs_to :customer
  has_many :designers, through: :items
  has_many :items

  has_many :messages, dependent: :destroy
end
