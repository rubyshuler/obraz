class Look < ApplicationRecord
  belongs_to :stylist

  has_many :favorites, dependent: :destroy

  has_and_belongs_to_many :items
  has_many_attached :images

  def thumbnail(url)
    return self.images[url].variant(resize: '576X600').processed
  end
end
