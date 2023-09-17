class CommentarysController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find params[:post_id]
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post), notice: "Votre commentaire a bien été publié"
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
