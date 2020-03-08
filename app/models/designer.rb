class Designer < ApplicationRecord
  enum role: [:designer, :stylist]

  has_one :user
  has_many :items
  has_many :announcements
end
