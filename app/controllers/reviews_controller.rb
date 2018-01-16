class ReviewsController < ApplicationController
  before_action :set_movie, only: %i[index new create destroy edit]

  def index
    @reviews = @movie.reviews.order(created_at: :desc)
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)

    if @review.save
      redirect_to movie_reviews_path(@movie), notice: 'Thanks for  your review!'
    else
      render 'new'
    end
  end

  def destroy
    @review = @movie.reviews.find(params[:id])

    @review.destroy
    redirect_to movie_reviews_path(@movie), notice: "Review successfully deleted!"
  end

  def edit
    @review = @movie.reviews
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:name, :comment, :stars)
  end
end
