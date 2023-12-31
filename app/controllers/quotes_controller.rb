class QuotesController < ApplicationController
  def index
    @quotes = Quote.includes(:meeting).order("meetings.id DESC")
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to quote_path(@quote)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    @quote.update(quote_params)
    redirect_to quote_path(@quote)
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect_to quotes_path
  end

  private

  def quote_params
    params.require(:quote).permit(:company_name, :description, :price, :date_start, :date_end, :meeting_id)
  end
end
