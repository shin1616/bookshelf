class BooksController < ApplicationController
  def index
    @books = Book.order('created_at DESC')
  end
  
  def new
  	@book = Book.new
  	if params[:title]
  		@books = RakutenWebService::Books::Book.search(title: params[:title])
  	end
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  		title = @book.title
  		author = @book.author
  		image = @book.mediumImageUrl
  		url = @book.itemUrl
  		publisher = @book.publisherName
  		price = @book.itemPrice
  		size = @book.size
  		isbn = @book.isbn

  		redirect_to '/'
  	else
  		render new_books_path
  	end
  end

  def show
    @book = Book.find(params[:id])
  end


  private
  def book_params
  	params.require(:book).permit(:title, :author, :mediumImageUrl, :itemUrl, :publisherName, :itemPrice, :size, :isbn).merge(user_id: current_user.id)
  end
end
