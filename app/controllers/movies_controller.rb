class MoviesController < ApplicationController
  before_action :set_movie, only: :show
  before_action :set_movies, only: :index

  def index
  end

  def show
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_movies
    @movies = Movie.all
  end
end
