class Item < ApplicationRecord
  belongs_to :designer

  has_many :favorites, dependent: :destroy

  has_many :item_quantities
  has_many :sizes, through: :item_quantities
  has_many :colors, through: :item_quantities

  has_many :items_orders
  has_many :orders, through: :items_orders
  has_many :shopping_carts, through: :items_orders

  has_and_belongs_to_many :looks

  has_many_attached :images
  validate :images_exist

  def thumbnail(url)
    return self.images[url].variant(resize: '576X600').processed
  end

  def images_exist
    errors.add(:images, 'У продукта должна быть фотография') if images.attached? == false

    images.each do |image|
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, 'Разрещение фотографии JPEG или PNG')
      end
    end
  end
end
