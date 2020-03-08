class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :item, counter_cache: true
  belongs_to :look, counter_cache: true
end
