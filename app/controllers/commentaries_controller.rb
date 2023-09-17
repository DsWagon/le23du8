class CommentariesController < ApplicationController

  def new
    @commentary = Commentary.new
  end

  def create
    @post = Post.find params[:post_id]
    @commentary = Commentary.new(commentary_params)
    @commentary.user = current_user
    @commentary.post = @post
    if @commentary.save
      redirect_to post_path(@post), notice: "Votre commentaire a bien été publié"
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  private

  def commentary_params
    params.require(:commentary).permit(:content)
  end
end
