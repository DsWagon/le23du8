class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create_comment_meeting
    @meeting = Meeting.find(params[:meeting_id])
    @comment = Comment.new(comment_params)
    @comment.meeting = @meeting
    @comment.user = current_user
    if @comment.save
      redirect_to meeting_path(@meeting)
    else
      render 'meetings/show'
    end
  end

  def create_comment_quote
    @quote = Quote.find(params[:quote_id])
    @comment = Comment.new(comment_params)
    @comment.quote = @quote
    @comment.user = current_user
    if @comment.save
      redirect_to quote_path(@quote)
    else
      render 'quotes/show'
    end
  end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
