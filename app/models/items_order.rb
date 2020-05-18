class ItemsOrder < ApplicationRecord
  belongs_to :item
  belongs_to :designer
  belongs_to :shopping_cart
  belongs_to :order
end
