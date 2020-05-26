class Order < ApplicationRecord
  enum status: {
    paid: 'Оплачен',
    in_progress: 'В обработке',
    shipped: 'Отправлен',
    delivered: 'Доставлен',
    canceled: 'Отменен'
  }

  belongs_to :designer

  has_many :items_orders
  has_many :items, through: :items_orders

  has_many :messages, dependent: :destroy
end
