class CommentsController < ApplicationController
  def create
    # raise params.inspect
      book = Book.find(params[:comment][:id])
      comment = book.comments.build(content: params[:comment][:content], user: current_user)
    if logged_in?
      if comment.save
        flash[:success] = "Comment posted!"
        redirect_to author_book_path(book.author, book)
      else
        redirect_to author_book_path(book.author, book)
      end
    else
      flash[:danger] = "Must be logged in to post comment"
      redirect_to author_book_path(book.author, book)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :id)
    end
end