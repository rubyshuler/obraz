LOOK_NAME = [
  'Отвязная вечеринка',
  'Неповторимый тай-дай',
  'Нежность до кончиков пальцев',
  'Пшш, можно обжечься',
  'Дикий патихард',
  'Спокойная тусовка',
  'Покорение мира',
  'Образ последипломной тусовщицы',
  'Путешествие в страну фей',
  'Заводной мандарин'
]

LOOK_NAME.each do |name|
  look = Look.create(
    name: name,
    description: ::DESCRIPTION.sample,
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
end
