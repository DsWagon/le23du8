class MeetingsController < ApplicationController
  load_and_authorize_resource
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update]

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
