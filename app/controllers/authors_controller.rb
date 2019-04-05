class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show 
    @author = Author.find(params[:id])
    render json: @author 
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :middle_name, :last_name)
    end

    def set_author
      @author = Author.find(params[:id])
    end
end