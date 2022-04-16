class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.all.where(author_id: params[:user_id])
    @comments = Comment.all.includes(:post_id)
    @likes = Like.all.includes(:post_id)
  end

  def show
    @comments = Comment.all.order(created_at: :desc)
    @post = Post.find_by(author_id: params[:user_id], id: params[:id])
    @user = User.find_by(id: params[:user_id])
    @users = User.all
    @likes = Like.all.includes(:post_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author_id: params[:user_id], title: params[:title], text: params[:text])
    redirect_back(fallback_location: root_path)
    flash.alert = if @post.save
                    'Post created...'
                  else
                    "Post failed, #{@post.errors.full_messages}"
                  end
  end

  def edit; end

  def update; end

  private

  def user_params
    params.require(:post).permit(:title, :text)
  end
end
