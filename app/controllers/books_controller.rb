class BooksController < ApplicationController

    # Index action to display all books
    def index
      @books = Book.all
    end
  
    # New action for creating a new book
    def new
      @book = Book.new
    end
  
    # Create action to save a new book to the database
    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to books_path, notice: 'Book was successfully created.'
      else
        render :new
      end
    end
  
    # Edit action to edit an existing book
    def edit
      @book = Book.find(params[:id])
    end
  
    # Update action to update an existing book in the database
    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path(@book), notice: 'Book was successfully updated.'
      else
        render :edit
      end
    end
  
    # Show action to display details of a specific book
    def show
      @book = Book.find(params[:id])
    end
  
    # Destroy action to delete a book from the database
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path, notice: 'Book was successfully deleted.'
    end
  
    private
  
    # Strong parameters to allow only specific attributes
    def book_params
      params.require(:book).permit(:title, :author, :price, :published_date)
    end
  end