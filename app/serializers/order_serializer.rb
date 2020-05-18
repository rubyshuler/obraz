class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :order_price, :order_created_at, :designer_id, :delivered_at,
  :tracking_number, :shipped_at, :address

  # belongs_to :designer, serializer: DesignerSerializer
  has_many :items, serializer: ItemsSerializer

  def order_created_at
    object.created_at.strftime('%d %B %Y %H:%M')
  end

  def user_address
    address = object.address
    "#{address[:city]}, #{address[:street]}"
  end

  def order_price
    prices = object.items.map {|item| item.price }
    price = prices.inject(0, :+){|sum,x| sum + x }
    price
  end
end
