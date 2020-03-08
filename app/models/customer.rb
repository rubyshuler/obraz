class Customer < ApplicationRecord
  has_one :user
  has_many :orders
  has_many :favorites
end
