class ShoppingCartsController < ApplicationController
  def show
    @shopping_cart = current_user.shopping_cart
  end

  private

  def shopping_cart_params
    params.fetch(:shopping_cart, {})
  end
end
