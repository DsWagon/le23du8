class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:legal]

  def home
    @posts = Post.all
  end

  def profile
    @user = current_user
    @user_flat = Flat.find_by(user_id: @current_user.id)
    @syndic = Syndic.first
  end

  def vip
    if current_user.vip?
    end
  end

  def admin
    if current_user.admin?
    end
  end
end
