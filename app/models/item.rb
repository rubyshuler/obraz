class Item < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :designer

  has_many_attached :images
end
