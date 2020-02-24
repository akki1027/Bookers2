class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  	@user = current_user
  end

  def show
  	@book = Book.find(params[:id])
  	@book = Book.new
  	@user = current_user
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if@book.save
  		redirect_to books_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end
  def update
  	book = Book.find(patams[:id])
  	if book.update(params[:id])
  		flash[:update] = "Book was successfully updated."
  		redirect_to book_path(book)
  	else
  		@books = Book.all
  		render 'index'
  	end
  end

  	private
  	def book_params
  	params.require(:book).permit(:title, :body)
  	end
end
