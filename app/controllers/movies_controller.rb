class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update]
  before_action :set_movies, only: %i[index]

  def index
  end

  def show
  end

  def edit
  end

  def update
    @movie.update!(movie_params)

    if @movie.save
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :total_gross, :release_date, :description)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_movies
    @movies = Movie.all
  end
end
