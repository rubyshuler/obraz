class ItemSerializer < ActiveModel::Serializer
  attributes :id, :price, :name

  # def item_images
  #   rails_blob_path(object.images, disposition: "attachment")
  # end
end
