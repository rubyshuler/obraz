require 'ffaker'
require 'faker'

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

10.times do
  Color.create(
    name: Faker::Color.color_name,
    color: Faker::Color.hex_color
  )
end

1.times do
  Size.sizes.values.each do |size|
    Size.create(
      size: size
    )
  end
end

5.times do |time|
  item_name = ['Латексные трусы', 'Платье из матрицы', 'Оранжевый хит сезона', 'Яркий лонгслив', 'Сумка наперевес' ]
  details = ['Круглый вырез', 'Длинные рукава', 'Лента с надписью «Вечеринка»', 'Облегающие манджеты и нижняя кромка', 'Размер соответствует указанному на этикетке']

  item = Item.create(
    name: item_name.sample,
    price: rand(800..7800),
    description: FFaker::LoremRU.sentences(sentence_count = 1),
    details: details.join(', '),
    designer_id: Designer.find(time + 1).id
  )

  int = rand(1..53)
  item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
  int = rand(1..53)
  item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))

  int = rand(1..53)
  item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))

  int = rand(1..53)
  item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))

  item.save!
  p "Items created #{time+1}/5"
end

4.times do
  Item.all.each do |item|
    ItemQuantity.create(
      size: Size.all.sample,
      color: Color.all.sample,
      quantity: rand(1..8),
      item: item,
    )
  end
end

10.times do |time|
  look_name = ['Отвязная вечеринка', 'Неповторимый тай-дай', 'Нежность до кончиков пальцев', 'Пшш, можно обжечься']
  look = Look.create(
    name: look_name.sample,
    description: FFaker::LoremRU.sentences(sentence_count = rand(1..3)).join(' '),
    details: FFaker::LoremRU.sentences(sentence_count = rand(3..6)).join(' '),
    quote: FFaker::LoremRU.sentences(sentence_count = 1).join(' '),
    stylist_id: Stylist.last.id
  )

  int = rand(1..53)
  look.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
  int = rand(1..53)
  look.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))

  int = rand(1..53)
  look.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))

  int = rand(1..53)
  look.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))

  look.items = Item.all.sample(3)

  look.save!
  p "Looks created #{time}/5"
end

5.times do
  designer = Designer.all.sample
  user = User.customer.sample

  order = Order.create(
    address: { city: 'Москва', street: 'Мясницкая' },
    status: 'Оплачен',
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


2.times do
  designer = Designer.first
  user = User.customer.sample

  order = Order.create(
    address: { city: 'Москва', street: 'Мясницкая' },
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
    address: { city: 'Москва', street: 'Мясницкая' },
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
