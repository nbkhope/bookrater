module Api
	module V1
		class ReviewsController < ApplicationController
			def index
		 		render json: Review.where(book_id: params[:book_id])
			end

			def create
				# @review = Review.new(review_params)
				# @book = Book.find(params[:book_id])
			end

			def update
				# @book = Book.find(params[:book_id])
				# @review = Review.find(params[:id])
			end
		end
	end
end