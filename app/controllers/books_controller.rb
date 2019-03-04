class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    # raise params.inspect
    if params[:author_id]
      @books = Author.find(params[:author_id]).books
    else
      @books = Book.all
    end
  end

  def latest
    @books = Book.latest
  end

  def show
  end

  def new
    if logged_in?
      @book = Book.new(author_id: params[:author_id])
    else
      flash[:danger] = "Must be logged in to add book"
      redirect_to root_path
    end
  end

  def create
    # raise params.inspect
    @book = Book.new(book_params)

    if @book.valid?
      @book.save
      redirect_to author_book_path(Author.find(@book.author_id), @book)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to author_book_path(Author.find(params[:book][:author_id]), @book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :release_date, :author_full_name, :genre_name)
    end

#     {"utf8"=>"✓",
#  "authenticity_token"=>"UDAMZ7oGSytTMeKuVZXLCwEKCwoHWcl47DA/r68M5zjNSujE43Btdt0fA/pKLc72wZGU0MYQCoFLM82P+SwqXQ==",
#  "book"=>{"title"=>"The Night", "author_id"=>"1", "genre_id"=>"1", "release_date"=>"1990-01-20"},
#  "commit"=>"Create Book"}

    def set_book
      @book = Book.find(params[:id])
    end
end