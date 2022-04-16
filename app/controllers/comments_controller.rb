class CommentsController < ApplicationController
  def index; end

  def show; end

  def create
    @comment = Comment.new(author_id: current_user.id, text: comment_params[:text], post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
    flash.alert = if @comment.save
                    'Comment posted...'
                  else
                    'Comment failed...'
                  end
  end

  def update; end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
