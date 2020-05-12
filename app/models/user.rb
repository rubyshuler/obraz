class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    admin: 'админ',
    moderator: 'модератор',
    designer: 'дизайнер',
    stylist: 'стилист',
    customer: 'покупатель'
  }

  has_one :designer
  has_one :stylist
  has_one :shopping_cart
  has_many :messages, dependent: :destroy
  has_many :favorites
  has_one_attached :image
end
