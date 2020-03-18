class FollowsController < ApplicationController
	def create
    @user = User.find(params[:follow][:followed_id])
    current_user.follow!(@user)
    redirect_to request.referrer || root_path
  end

  def destroy
    @user = Follow.find(params[:id])
    current_user.unfollow!(@user)
    redirect_to request.referrer || root_path
  end
end
