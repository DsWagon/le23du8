class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show, :new, :create, :edit, :update, :destroy]

  def index
    valid_categories = [:vente, :achat, :don, :news]
    default_category = [:vente, :achat, :don]

    if params[:query].present?
      @posts = Post.where(category: params[:query]).order(created_at: :desc)
    elsif params[:category].in?(valid_categories.map(&:to_s))
      @posts = Post.where(category: params[:category]).order(created_at: :desc)
    else
      @posts = Post.where(category: default_category).order(created_at: :desc)
    end

    case params[:category]
    when *valid_categories.map(&:to_s) # Vérifie si la catégorie est valide
      @posts = Post.where(category: params[:category].to_sym).order(created_at: :desc)
    when "annonces"
      @posts = Post.where(category: [:vente, :achat, :don]).order(created_at: :desc)
    when "actualites"
      @posts = Post.where(category: [:news]).order(created_at: :desc)
    else
      # Gérer d'autres catégories si nécessaire
      @posts = Post.where(category: default_category).order(created_at: :desc)
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
