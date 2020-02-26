class UsersController < ApplicationController
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
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image, :email, :password)
  end
end
