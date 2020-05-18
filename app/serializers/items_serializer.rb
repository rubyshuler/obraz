class ItemsSerializer < ActiveModel::Serializer
  attributes :id, :first_image

  def first_image
    rails_blob_path(object.images.first, only_path: true)
  end
end
