class Stylist < ApplicationRecord
  has_many :looks
  belongs_to :user
end
