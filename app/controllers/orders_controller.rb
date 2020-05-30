class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all.reverse
  end

  def show
    @order_json = OrderSerializer.new(@order).to_json
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @shopping_cart = current_user.shopping_cart
    @items_orders = ItemsOrder.where(shopping_cart: @shopping_cart)
    @items = @shopping_cart.items
    @designers = @items_orders.map(&:designer)

    @designers.each do |designer|
      order = Order.new(order_params)
      order.user_id = current_user.id
      order.designer = designer
      order.status = 'paid'
      order.save
      designer_item_orders = @items_orders.where(designer_id: designer.id)
      order.items_orders << designer_item_orders
      designer_item_orders.each do |items_order|
        items_order.update(
          order_id: order.id,
          shopping_cart: nil
        )
      end
    end

    @shopping_cart.items_orders = []

    respond_to do |format|
      format.html { redirect_to orders_order_added_path }
      format.js
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def order_added; end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(
        :weight,
        :shipped_at,
        :tracking_number,
        :delivered_at,
        :address
      )
    end
end
