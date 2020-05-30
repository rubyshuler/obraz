module ShoppingCartsHelper
  def chosen_size(item)
    size = ItemsOrder.where(
      shopping_cart: current_user.shopping_cart,
      item: item
    )&.last&.chosen_size

    Size.find(size.to_i).size if size.present?
  end
end
