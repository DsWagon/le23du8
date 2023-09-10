class MeetingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create]

  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    meeting = Meeting.new(meeting_params)
    if meeting.save
      redirect_to meeting_path(meeting)
    else
      render :new
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
    @comment = Comment.new
  end
end

private

def meeting_params
  params.require(:meeting).permit(:title, :description, :date, :syndic_id)
end
