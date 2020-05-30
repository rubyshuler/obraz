class ItemsOrder < ApplicationRecord
  belongs_to :item
  belongs_to :designer
  belongs_to :shopping_cart, required: false
  belongs_to :order, required: false
end
