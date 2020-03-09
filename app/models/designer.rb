class Designer < ApplicationRecord
  enum role: [:designer, :stylist]

  belongs_to :user

  has_many :items
  has_many :announcements
end
