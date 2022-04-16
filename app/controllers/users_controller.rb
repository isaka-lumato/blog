class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    user_signed_in?
    current_user
    user_session
    @user = User.all
    @posts = Post.all
  end

  def show
    @likes = Like.all.includes(:post_id)
    @comments = Comment.all.includes(:post_id).order(created_at: :desc)
    @user = current_user
  end
end
