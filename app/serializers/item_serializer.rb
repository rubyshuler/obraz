class ItemSerializer < ActiveModel::Serializer
  attributes :id, :price, :name, :first_image, :brand_name

  def first_image
    rails_blob_path(object.images.first, only_path: true)
  end

  def brand_name
    object.designer.brand_name
  end
end
