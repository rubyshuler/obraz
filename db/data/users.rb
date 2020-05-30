
2.times do
  user = User.create(
    email: Faker::Internet.email,
    name: FFaker::NameRU.name,
    role: 'покупатель',
    password: 'testtest'
  )

  shopping_cart = ShoppingCart.create(user_id: user.id)

  user.update(shopping_cart_id: shopping_cart.id)
end

5.times do |time|
  user = User.create(
    email: Faker::Internet.email,
    name: FFaker::NameRU.name,
    role: 'дизайнер',
    password: 'testtest'
  )

  shopping_cart = ShoppingCart.create(user_id: user.id)

  user.update(shopping_cart_id: shopping_cart.id)

  designer = Designer.create(user_id: user.id, brand_name: 'Название бренда', description: 'В основе политики бренда — демократические цены и создание вещей, которые принадлежат покупателю, а не порабощают его.')

  user.update(designer_id: designer.id)

  p "Designers are created #{time+1}/5"
end

2.times do
  user = User.create(
    email: Faker::Internet.email,
    name: FFaker::NameRU.name,
    role: 'стилист',
    password: 'testtest'
  )

  stylist = Stylist.create(user_id: user.id)

  user.update(stylist_id: stylist.id)
end
