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
      params.require(:book).permit(:title, :release_year, :author_full_name, :genre_name)
    end

    def set_book
      @book = Book.find(params[:id])
    end
end