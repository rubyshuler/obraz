class DesignerSerializer < ActiveModel::Serializer
  attributes :id

  has_many :orders, serializer: OrderSerializer
end
