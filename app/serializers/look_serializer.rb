class LookSerializer < ActiveModel::Serializer
  attributes :id, :name, :first_image, :look_price

  def first_image
    rails_blob_path(object.images.first, only_path: true)
  end

  def look_price
    prices = object.items.map {|item| item.price }
    price = prices.inject(0, :+){|sum,x| sum + x }
    price
  end
end
