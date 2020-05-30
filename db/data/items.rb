COLOR = %w[
  #DAE1F6
  #CA4716
  #C95582
  #FFFFFF
  #8C8C90
  #9FBFFF
  #212121
  #DA878B
  #D4761E
  #854A4E
  #FF612F
  #76150E
]

COLOR.each do |color|
  Color.create(
    name: Faker::Color.color_name,
    color: color
  )
end

Size.sizes.values.each do |size|
  Size.create(
    size: size
  )
end

DESCRIPTION = [
  'Супер вещь приготовила тебя к полету! Пусть музыка вознесет тебя на новые высоты в этом сладком коротком укороченном топе, который имеет прозрачную сетчатку, шипастые акценты на воротнике и  графику спереди.',
  'Зашнуруй ботинки, потому что ты обречена на новый вид приключений. Город — это твоя игровая площадка в этих свирепых сапогах с заостренными носками, расклешенными каблуками, дерзкой шнуровкой и боковыми застежками-молниями.',
  'Настроение посмотреть, как горит мир! Восстаньте из пепла в этом свирепом мини-платье с длинным рукавом, которое имеет эластичную вязаную конструкцию и металлическую графику на лифе.',
  'В этом образе твои мечты чудесным образом начинают сбываться. Зачарованный лес ждет тебя и твою подружку-фею в этом эйфорическом мини-платье с открытой спиной, регулируемым ремешком для галстука и психоделическим свечением в темном грибном принте.',
  'Мини платье «в тени», потому что никто не должен знать, что ты делаешь в темноте, крошка! Очаруй всех в этом романтическом мини-платье с прозрачным длинным пышным рукавом с открытыми плечами и рюшами на груди.',
  'Прокладывай путь в ад в этом потрепанном свитере с длинными рукавами, ребристой конструкцией и громоздкой негабаритной посадкой, чтобы показать всем, что круче тебя больше нет.'
]

ITEM_NAME = ['Латексные трусы', 'Платье из матрицы', 'Оранжевый хит сезона', 'Яркий лонгслив', 'Сумка наперевес', 'Кожаный плащ', 'Шипастая футболка', 'Платье с феями', 'Панкрок', 'Платье в сетку']

ITEM_NAME.each do |item_name|
  details = ['Круглый вырез', 'Длинные рукава', 'Лента с надписью «Вечеринка»', 'Облегающие манджеты и нижняя кромка', 'Размер соответствует указанному на этикетке']

  item = Item.create(
    name: item_name,
    price: rand(800..7800),
    description: DESCRIPTION.sample,
    details: details.join(', '),
    designer_id: rand(1..4)
  )

  int = 1 + ITEM_NAME.index(item_name)
  item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))
  int = 2 + ITEM_NAME.index(item_name)
  item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))

  int = 3 + ITEM_NAME.index(item_name)
  item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))

  int = 4 + ITEM_NAME.index(item_name)
  item.images.attach(filename: "#{int}.jpg", io: File.open("db/images/#{int}.jpg", content_type: "image/jpg"))

  item.save!
end

4.times do
  Item.all.each do |item|
    Size.all.each do |size|
      ItemQuantity.create(
        size: size,
        color: Color.all.sample,
        quantity: rand(1..8),
        item: item
      )
    end
  end
end
