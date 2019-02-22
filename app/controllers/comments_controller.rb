class CommentsController < ApplicationController
  def create
    # raise params.inspect
    book = Book.find(params[:comment][:id])
    comment = book.comments.build(content: params[:comment][:content], user: current_user)

    if comment.save
      flash[:success] = "Comment posted!"
      redirect_to author_book_path(book.author, book)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :id)
    end
end