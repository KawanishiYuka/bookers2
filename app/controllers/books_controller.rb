class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else
     @user = current_user
     @books = Book.page(params[:page]).reverse_order
     render :index
    end  
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book = Book.new
    @book_detail = Book.find(params[:id])
    @user = @book_detail.user
  end
  
  def edit
    @book_detail = Book.find(params[:id])
    if @book_detail == current_user
      render :edit
    else
      redirect_to books_path
    end
  end
  
  def update
    @book_detail = Book.find(params[:id])
    if @book_detail.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book_detail.id)
    else
      render :edit
    end
  end

  def destroy
    @book_detail = Book.find(params[:id])
    @book_detail.destroy
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
end
