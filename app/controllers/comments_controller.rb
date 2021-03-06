class CommentsController < ApplicationController
  before_action :sign_in_to_access, only: [:create]

  def create
    book = Book.find(params[:comment][:book_id])
    comment = book.comments.build(content: params[:comment][:content], user: current_user)
    if comment.save
      render json: book, status: 201
    else
      redirect_to author_book_path(book.author, book)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :id)
    end
end