5.times do
  designers = Item.all.map {|item| item.designer }.uniq
  user = User.customer.sample


  designers.each do |designer|
    order = Order.create(
      address: FFaker::AddressRU.city+ ', ' + FFaker::AddressRU.street_address,
      status: 'Оплачен',
      user_id: user.id,
      designer_id: designer.id
    )

    item_order = ItemsOrder.create(
      designer_id: designer.id,
      item_id: designer.items.sample.id,
      shopping_cart_id: user.shopping_cart.id,
      order_id: order.id,
      chosen_size: Size.all.sample.id
    )
  end
end

2.times do
  designer = Designer.first
  user = User.customer.sample

  address = FFaker::AddressRU.city + FFaker::AddressRU.street_address

  order = Order.create(
    address: address,
    status: 'Отправлен',
    user_id: user.id,
    designer_id: designer.id
  )

  item_order = ItemsOrder.create(
    designer_id: designer.id,
    item_id: designer.items.sample.id,
    shopping_cart_id: user.shopping_cart.id,
    order_id: order.id
  )
end

3.times do
  designer = Designer.first
  user = User.customer.sample

  order = Order.create(
    address: FFaker::AddressRU.city + FFaker::AddressRU.street_address,
    status: 'Доставлен',
    user_id: user.id,
    designer_id: designer.id
  )

  item_order = ItemsOrder.create(
    designer_id: designer.id,
    item_id: designer.items.sample.id,
    shopping_cart_id: user.shopping_cart.id,
    order_id: order.id
  )
end
