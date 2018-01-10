class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]
  before_action :set_movies, only: %i[index]

  layout 'movie_layout'

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

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create!(movie_params)

    if @movie.save!
      redirect_to movie_path(@movie)
    else
      render 'new', notice: 'Breh, can\'t do that'
    end
  end

  def destroy
    @movie.delete
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :total_gross,
                                  :release_date, :description,
                                  :image_file_name, :director, :cast,
                                  :duration
                                )
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_movies
    @movies = Movie.released
  end
end
