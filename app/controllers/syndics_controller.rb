class SyndicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update]

  # def index
  #   @syndics = Syndic.all
  # end

  # def new
  #   @syndic = Syndic.new
  # end

  # def create
  #   syndic = Syndic.new(syndic_params)
  #   if syndic.save
  #     redirect_to syndic_path(syndic)
  #   else
  #     render :new
  #   end
  # end

  # def show
  #   @syndic = Syndic.find(params[:id])
  # end

  # def edit
  #   @syndic = Syndic.find(params[:id])
  # end

  # def update
  #   @syndic = Syndic.find(params[:id])
  #   @syndic.update(syndic_params)
  #   redirect_to syndic_path(@syndic)
  # end

  # def destroy
  #   @syndic = Syndic.find(params[:id])
  #   @syndic.destroy
  #   redirect_to syndics_path
  # end

  # private

  # def syndic_params
  #   params.require(:syndic).permit(:name, :address, :phone, :email, :drescription)
  # end
end
