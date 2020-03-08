class Look < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :designer
  has_many :items
end
