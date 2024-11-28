class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    book_comment = BookComment.new(comment_params)
    book_comment.user_id = current_user.id
    book_comment.book_id = book.id
    book_comment.save
    redirect_to books_path
  end

  def destroy
  end

  private
  def comment_params
    params.require(:book_comment).permit(:comment)
  end

end
