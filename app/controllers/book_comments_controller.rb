class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:id])
    comment = BookComment.new(book_comment_params)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
