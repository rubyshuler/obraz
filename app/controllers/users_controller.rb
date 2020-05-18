class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @profile_json = UserSerializer.new(@user).to_json
  end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.js
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :surname,
      :birthdate
    )
  end
end
