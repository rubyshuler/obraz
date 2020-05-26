class DesignerSerializer < ActiveModel::Serializer
  attributes :id, :looks

  has_many :orders, serializer: OrderSerializer
  has_many :items, serializer: ItemSerializer

  def looks
    looks = items.map { |item| item.looks }
    looks_json = ActiveModel::ArraySerializer.new(looks, serializer: LookSerializer).as_json
    looks_json.flatten
  end
end
