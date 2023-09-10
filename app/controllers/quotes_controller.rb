class QuotesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create]

  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def create
    quote = Quote.new(quote_params)
    if quote.save
      redirect_to quote_path(quote)
    else
      render :new
    end
  end

  def show
    @quote = Quote.find(params[:id])
    @comment = Comment.new
  end

  private

  def quote_params
    params.require(:quote).permit(:company_name, :description, :price, :date_start, :date_end, :meeting_id)
  end
end
