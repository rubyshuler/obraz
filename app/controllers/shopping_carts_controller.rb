class ShoppingCartsController < ApplicationController
  def show
    @shopping_cart = current_user.shopping_cart
  end

  def update
    @shopping_cart = current_user.shopping_cart

    respond_to do |format|
      if @item.update(shopping_cart_params)
        format.html { redirect_to @shopping_cart }
        format.json { render :show, status: :ok, location: @shopping_cart }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shopping_cart = current_user.shopping_cart
    item_order = @shopping_cart.items_orders.find_by(item_id: params[:current_item_id])
    item_order.destroy

    respond_to do |format|
      format.html { redirect_to @shopping_cart }
    end
  end

  private

  def shopping_cart_params
    params.fetch(:shopping_cart, {})
  end

  def shopping_cart_params
    params.require(:shopping_cart).permit(
      :current_item_id,
      items: []
    )
  end
end
