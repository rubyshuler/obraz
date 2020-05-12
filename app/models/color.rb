class Color < ApplicationRecord
  has_many :item_quantities
  has_many :items, through: :item_quantities
  has_many :sizes, through: :item_quantities
end
