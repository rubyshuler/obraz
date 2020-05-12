class Order < ApplicationRecord
  enum status: { new_order: 'Новый', in_progress: 'В обработке' }

  has_many :items

  has_many :messages, dependent: :destroy
end
