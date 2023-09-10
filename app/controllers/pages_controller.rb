class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :profile, :admin ]

  def home
  end

  def about
  end

  def profile
    @user = current_user
    @user_flat = Flat.find_by(user_id: @current_user.id)
    @syndic = Syndic.first

  end

end
