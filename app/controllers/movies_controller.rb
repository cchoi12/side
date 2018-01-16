class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]
  def index
    @movies = Movie.released
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'movie successfully updated'
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'movie successfully created'
    else
      render :new
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, alert: 'movie deleted'
  end

private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).
      permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
  end
end
