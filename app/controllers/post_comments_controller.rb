class PostCommentsController < ApplicationController
	before_action :correct_user, only: [:destroy]
	def create
		book = Book.find(params[:book_id])
		comment = current_user.post_comments.new(post_comment_params)
		comment.book_id = book.id
		comment.save
		redirect_to request.referrer || root_path
	end
	def destroy
		book = Book.find(params[:book_id])
		comment = current_user.post_comments.find_by(book_id: book.id)
		comment.destroy
		redirect_to request.referrer || root_path
	end

	private
		def post_comment_params
			params.require(:post_comment).permit(:comment)
		end
		def correct_user
	      book = Book.find(params[:book_id])
	      comment = current_user.post_comments.find_by(book_id: book.id)
	      if current_user != comment.user
	      redirect_to books_path
	    end
	end
end
