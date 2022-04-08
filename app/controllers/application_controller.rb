class ApplicationController < ActionController::Base
  def current_user
    # User.find(params[:user_id])
    User.first
  end

  helper_method :current_user
end
