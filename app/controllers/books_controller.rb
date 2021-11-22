class BooksController < ApplicationController

  def create
  end

  def index
    @user = User.find(params[:id])
    @book = Book.new
  end

  def show
  end
  
  def edit
  end
  
  def update
  end

  def destroy
  end
  
end
