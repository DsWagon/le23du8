class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
    @meetings = Meeting.all.order(date: :desc)
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to meeting_path(@meeting)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
    @quotes = @meeting.quotes
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
    redirect_to meeting_path(@meeting)
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to meetings_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :description, :date, :syndic_id)
  end
end
