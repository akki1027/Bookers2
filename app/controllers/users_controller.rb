class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]
  def index
    @books = Book.all
  	@book = Book.new
  	@user = current_user
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	if @user.save
  		flash[:update] = "You have updated user successfully."
  		redirect_to user_path(current_user)
  	else
  		render 'edit'
  	end
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books
    Dotenv.load
  end

  def follow_list
    @user = User.find(params[:user_id])
  end

  def follower_list
    @user = User.find(params[:user_id])
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :email, :password, :postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end
end
