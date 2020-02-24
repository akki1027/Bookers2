class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params:id)
  end

  def new
  	@book = Book.new
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
