class Item < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :designer

  has_many_attached :images
  validate :images_exist

  def thumbnail(url)
    return self.images[url].variant(resize: '300X300').processed
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
