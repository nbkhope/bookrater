module Api
  class BooksController < ApplicationController
    def index
      @books = Book.all
      render json: @books
    end

    def show
      @book = Book.find(params[:id])
      render json: @book
    end

    # def new
    # end

    # def edit
    # end

    def create
      @book = Book.new(book_params)
      if @book.save
        render json: @book, status: :created, location: @book
      else
        err
      end
    end

    def update
      @book = Book.find(params[:id])

      if @book.update(book_params)
        head :no_content
      else
        err
      end
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      head :no_content
    end

    private

    def book_params
      params.permit(:title, :author, :summary, :cover)
    end

    def err
      render json: @book.errors, status: :unprocessable_entity
    end
  end
end