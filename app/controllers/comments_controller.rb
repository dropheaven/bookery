class CommentsController < ApplicationController
  before_action :sign_in_to_access, only: [:create]

  def create
    # raise params.inspect
    book = Book.find(params[:comment][:id])
    comment = book.comments.build(content: params[:comment][:content], user: current_user)
    if comment.save
      flash[:success] = "Comment posted!"
      redirect_to author_book_path(book.author, book)
    else
      flash[:notice] = "Could not post. Please make sure you're signed in and your post isn't empty."
      redirect_to author_book_path(book.author, book)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :id)
    end
end