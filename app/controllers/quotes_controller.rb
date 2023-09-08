class QuotesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find(params[:id])
    @comment = Comment.new
  end
end
