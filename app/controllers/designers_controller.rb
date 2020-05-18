class DesignersController < ApplicationController
  before_action :set_designer, only: [:show, :edit, :update]

  def show; end

  def orders
    @designer = current_user.designer
    @designer_json = DesignerSerializer.new(@designer).to_json
  end

  def new
    @designer = Designer.new
  end

  def create
    @designer = Designer.new(designer_params)
    @designer.user_id = current_user.id

    respond_to do |format|
      if @designer.save
        @designer.image.attach(params[:designer][:image])
        current_user.update(designer_id: @designer.id)
        format.html { redirect_to @designer, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @designer }
      else
        format.html { render :new }
        format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @designer.update(user_params)
        format.html { redirect_to @designer }
        format.json { render :show, status: :ok, location: @designer }
      else
        format.html { render :edit }
        format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_designer
    @designer = current_user.designer
  end

  def designer_params
    params.require(:designer).permit(:brand_name, :description)
  end
end
