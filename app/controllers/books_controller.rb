class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_to_access, only: [:new, :edit, :destroy]

  def index
    # raise params.inspect
    if params[:author_id]
      @books = Author.find(params[:author_id]).books
    else
      @books = Book.all
      @latest_book = Book.latest.first
    end
  end

  def show
  end

  def new
    @book = Book.new(author_id: params[:author_id])
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
      flash[:notice] = "Book updated!"
      redirect_to author_book_path(@book.author, @book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "Book has been deleted!"
    redirect_to root_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :release_year, :author_full_name, :genre_name)
    end

    def set_book
      @book = Book.find(params[:id])
    end
end