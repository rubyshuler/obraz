# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'
require 'faker'


# 5.times do |time|
#   user = User.create(
#     email: Faker::Internet.email,
#     name: FFaker::NameRU.name,
#     password: 'testtest'
#   )
#
#   designer = Designer.create!(user_id: user.id)
#   customer = Customer.create!(user_id: user.id)
#
#   user.update(designer_id: designer.id, customer_id: customer.id)
#
#   p "Users created #{time}/5"
# end
#
# 10.times do |time|
#   item_name = ['Латексные трусы', 'Платье из матрицы', 'Оранжевый хит сезона', 'Яркий лонгслив', 'Сумка наперевес' ]
#   details = ['Круглый вырез', 'Длинные рукава', 'Лента с надписью «Вечеринка»', 'Облегающие манджеты и нижняя кромка', 'Размер соответствует указанному на этикетке']
#
#   item = Item.create(
#     name: item_name.sample,
#     amount: 5,
#     price: rand(800..7800),
#     description: FFaker::LoremRU.sentences(sentence_count = rand(1..2)),
#     details: details,
#     designer_id: Designer.last.id
#   )
#
#   int = rand(1..53)
#   item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
#   int = rand(1..53)
#   item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
#
#   int = rand(1..53)
#   item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
#
#   int = rand(1..53)
#   item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
#
#   item.save!
#   p "Items created #{time}/5"
# end
#
# 10.times do |time|
#   look_name = ['Отвязная вечеринка', 'Неповторимый тай-дай', 'Нежность до кончиков пальцев', 'Пшш, можно обжечься']
#   look = Look.create(
#     price: rand(4500..16700),
#     name: look_name.sample,
#     description: FFaker::LoremRU.sentences(sentence_count = rand(3..9)),
#     designer_id: Designer.last.id
#   )
#
#
#   int = rand(1..53)
#   look.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
#   int = rand(1..53)
#   look.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
#
#   int = rand(1..53)
#   look.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
#
#   int = rand(1..53)
#   look.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
#
#
#
#   look.save!
#   p "Looks created #{time}/5"
#
# end

2.times do
  order = Order.create(
    status: :new_order,
    customer_id: Customer.last.id
  )
  order.items = Item.all.take(3)
  order.save!
end
