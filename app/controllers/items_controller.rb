class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :add_to_order]

  def index
    @items_cards = Item.all.with_attached_images
  end

  def show
    @items_cards = Item.all.with_attached_images
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.designer = current_user.designer

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_order
    @item.amount -= 1
    @order_item = @item.clone
    @order_item.update(chosen_size: params[:chosen_size])
    @order = Order.create!(customer_id: current_user.customer_id)
    @order_item.order_id = @order.id
    @order_item.save!
    redirect_to orders_path
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price, :description, :amount, :chosen_size, images: [])
    end
end
