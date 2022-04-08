class CommentsController < ApplicationController
  # def create
  #   @comment = current_user.comments.new(comment_params)

  #   respond_to do |format|
  #     if @comment.save
  #       format.html { redirect_to user_posts_path(current_user) }
  #     else
  #       format.html { render :show }
  #     end
  #   end
  # end

  # private

  # def comment_params
  #   params.require(:comment).permit(:text)
  # end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = current_user.comments.new(
      text: comment_params,
      author_id: current_user.id,
      post_id: @post.id
    )
    @new_comment.post_id = @post.id
    if @new_comment.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Success!'
    else
      render :new, alert: 'Error occured!'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
