module ItemsHelper
  def item_sizes(item)
    item.sizes.map {|size| [size.size, size.id]}.uniq
  end
end
