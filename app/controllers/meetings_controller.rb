class MeetingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @meetings = Meeting.all
  end

  def new
  end

  def create
  end

  def show
    @meeting = Meeting.find(params[:id])
  end
end
