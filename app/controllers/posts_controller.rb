class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update, :destroy]

  def index
    valid_categories = [:vente, :achat, :don]

    if params[:category].present?
      if valid_categories.include?(params[:category].to_sym)
        @posts = Post.where(category: params[:category])
      elsif params[:category] == "annonces"
        @posts = Post.where(category: valid_categories)
      else
        # Gérer d'autres catégories si nécessaire
      end
    else
      @posts = Post.where(category: valid_categories)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post), notice: "Votre annonce a bien été publiée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find params[:id]
    @commentary = Commentary.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
end
