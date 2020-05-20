class LooksController < ApplicationController
  before_action :set_look, only: [:show, :edit, :update, :destroy]

  def index
    @looks = Look.all
  end

  def show
    @items_cards = Item.all.take(5)
  end

  def new
    @look = Look.new
  end

  def edit
  end

  def create
    @look = Look.new(look_params)

    respond_to do |format|
      if @look.save
        format.html { redirect_to @look, notice: 'Look was successfully created.' }
        format.json { render :show, status: :created, location: @look }
      else
        format.html { render :new }
        format.json { render json: @look.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @look.update(look_params)
        format.html { redirect_to @look, notice: 'Look was successfully updated.' }
        format.json { render :show, status: :ok, location: @look }
      else
        format.html { render :edit }
        format.json { render json: @look.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @look.destroy
    respond_to do |format|
      format.html { redirect_to looks_url, notice: 'Look was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_look
      @look = Look.find(params[:id])
    end

    def look_params
      params.require(:look).permit(:name, :price, :description, :designer_id, images: [])
    end
end
