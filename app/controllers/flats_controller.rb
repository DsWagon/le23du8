class FlatsController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_flat, only: [ :edit, :update]

  def edit
    @user = current_user
    @user_flat = Flat.find_by(user_id: @current_user.id)
  end

  def update
    @user = current_user
    @user_flat = Flat.find_by(user_id: @current_user.id)
    @user_flat.update(flat_params)
    redirect_to profile_path
  end

  private

  def flat_params
    params.require(:flat).permit(:floor, :surface, :lot)
  end

  def set_flat
    @user_flat = Flat.find(params[:id])
  end
end
