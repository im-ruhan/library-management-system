class BooksController < ApplicationController
    before_action :set_library

    attr_accessor :library

    def create
        book = library.books.create(book_params)
        if book.save
            render json: BookSerializer.new(book), status: :created
        else
            render json: @book.errors, status: :unprocessable_entity
        end
    end

    def find_by_title
        search_title = params[:title]
        global_search = params[:global_search].present?
    
        books = if global_search
                  Book.where('title ILIKE ?', "%#{search_title}%")
                else
                  library.books.where('title ILIKE ?', "%#{search_title}%")
                end.where(available: true)
    
        render json: BookSerializer(books)
      end

    private

    def set_library
        @library = Library.find_by params[:library_id]
    end

    def book_params
        param.require(:book).permit(:isbn, :title, :author)
    end

end
