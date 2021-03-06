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
    @author = Author.find(params[:author_id])
    
    if @author.id != @book.author_id
      redirect_to root_path
      flash[:notice] = "Could not find that page!"
    else
      respond_to do |format|
        format.html
        format.json { render json: @book }
      end
    end
  end

  def new
    @book = Book.new(author_id: params[:author_id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to author_book_path(@book.author_id, @book)
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
    flash[:notice] = "#{@book.title} has been deleted!"
    redirect_to root_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :release_year, :author_name, :genre_name)
    end

    def set_book
      @book = Book.find(params[:id])
    end
end