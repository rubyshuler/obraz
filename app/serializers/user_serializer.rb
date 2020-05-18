class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :birthdate, :email

  has_many :orders, serializer: OrderSerializer
end
