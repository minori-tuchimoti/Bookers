class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
     @book = Book.new(book_params)
   if @book.save
    redirect_to @book, notice: 'successfully'
   else
    flash.now[:alert] = 'error'
     @books = Book.all  
     render :index
   end
  end


  def show
    @book = Book.find(params[:id])  
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
      redirect_to @book, notice: 'successfully'
    else
      flash[:alert] = 'error'
      render 'edit'
  end  
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, alert: '投稿を削除しました'
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
