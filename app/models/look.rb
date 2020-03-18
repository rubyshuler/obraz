class Look < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :designer
  has_many :items

  has_many_attached :images

  def thumbnail(url)
    return self.images[url].variant(resize: '576X600').processed
  end
end
