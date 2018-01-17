class ReviewsController < ApplicationController
  before_action :set_movie, only: %i[index new create destroy edit update]
  before_action :set_review, only: %i[edit update]
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
  end

  def update
    if @review.update(review_params)
      redirect_to movie_reviews_path(@movie), notice: "Update successful"
    else
      render 'edit'
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:name, :comment, :stars)
  end
end
