class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    @book.user_id = current_user.id
    @user = User.find(@book.user_id)
    @users = User.all
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render "index"
    end
  end

  def index
    @book = Book.new
    @user = User.find(current_user.id)
    @books = Book.all
    @users = User.all
    session['user'] = "books-index"
  end

  def show
    @book2 = Book.find(params[:id])
    @book = Book.new
    @user = User.find(@book2.user_id)
    @book_comment = BookComment.new
    @book_comments = BookComment.all
    session['user'] = "books-show"
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
