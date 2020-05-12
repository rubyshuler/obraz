class ItemQuantity < ApplicationRecord
  belongs_to :size
  belongs_to :color
  belongs_to :item
end
