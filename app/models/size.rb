class Size < ApplicationRecord
  has_many :item_quantities
  has_many :items, through: :item_quantities
  has_many :colors, through: :item_quantities

  enum size: {
    xs: 'xs',
    s: 's',
    m: 'm',
    l: 'l',
    xl: 'xl',
    xxl: 'xxl',
  }
end
