module LooksHelper
  def look_price(look)
    prices = look.items.map {|item| item.price }
    prices.inject(0, :+){|sum,x| sum + x }
  end
end
