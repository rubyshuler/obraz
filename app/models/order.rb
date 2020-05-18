class Order < ApplicationRecord
  enum status: {
    paid: 'Оплачен',
    in_progress: 'В обработке',
    shipped: 'Отправлен',
    delivered: 'Доставлен',
    canceled: 'Отменен'
  }

  has_one :designer
  accepts_nested_attributes_for :designer

  has_many :items_orders
  has_many :items, through: :items_orders

  has_many :messages, dependent: :destroy
end
