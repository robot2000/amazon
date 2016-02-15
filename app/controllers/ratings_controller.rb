class RatingsController < ApplicationController
  before_action :set_book

  def new
    #if user_signed_in?
      #@rating = @book.rating.new
    #else
      #redirect_to new_user_session_path, alert: 'You do sign in now.'
    #end
    


    @book = Book.find(params[:book_id])
    @rating = Rating.new
  end

  def create
    @rating = @book.ratings.new(rating_params)
    @rating.user = current_user

    if @rating.save
      redirect_to @book, notice: 'It was saved.'
    else
      redirect_to new_book_rating_url, alert: 'Not saved'
    end
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end

  def rating_params
    params.require(:rating).permit(:review, :value)
  end
end
