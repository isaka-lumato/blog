class LikesController < ApplicationController
  def create
    print current_user
    new_like = current_user.likes.new(like_params) # (author_id: params[:like][:author_id], post_id: params[:like][:post_id])

    if new_like.save
      redirect_to params[:like][:current_url], notice: 'Success!'
    else
      redirect_to params[:like][:current_url], notice: 'Sorry, like did not get save!'
    end
  end

  private

  def like_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
