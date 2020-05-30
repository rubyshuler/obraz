class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :add_to_order]

  def index
    @items_cards = Item.all.with_attached_images
  end

  def show
    @items_cards = Item.all.with_attached_images
    @item_action = { item: @item.as_json.merge(first_image), sizes: @item.sizes.as_json}.to_json
  end

  def first_image
    {
      first_image: url_for(@item.images[0])
    }
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
    choosen_item = ItemQuantity.where(
      item_id: @item.id,
      size_id: item_params[:chosen_size].to_i
    ).first

    choosen_item.update(
      quantity: (choosen_item.quantity - 1)
    )

    ItemsOrder.create(
      item_id: @item.id,
      designer_id: @item.designer.id,
      shopping_cart_id: current_user.shopping_cart.id,
      chosen_size: item_params[:chosen_size]
    )
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :price, :description, :amount, :chosen_size, images: [])
    end
end
