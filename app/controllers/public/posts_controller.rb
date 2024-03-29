class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :post_find, only: [:show, :edit, :update, :destroy]
  before_action :authentication_of_access, only:[:edit, :update, :destroy]

  def index
    @posts = Post.where(display_status: :true).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @medium = CategoryMedium.find(@post.category_medium_id)
    @motif = CategoryMotif.find(@post.category_motif_id)
    @style = CategoryStyle.find(@post.category_style_id)
    @comment = Comment.new
    @comments = @post.comments.order("created_at DESC").page(params[:page]).per(6)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    user = User.find(@post.user.id)
    if @post.destroy!
      redirect_to user_path(user.id)
    end
  end

  private
  # <before_actionメソッド>
  def post_find
    @post = Post.find(params[:id])
  end

  def authentication_of_access
    @post = Post.find(params[:id])
    @user = User.find(@post.user.id)
    redirect_to new_user_session_path unless @user.id == current_user.id
  end
  # </before_actionメソッド>

  def post_params
    params.require(:post).permit(:title, :introduction, :display_status, :image, :image_sub1, :image_sub2, :user_id, :category_medium_id, :category_motif_id, :category_style_id)
  end
end
