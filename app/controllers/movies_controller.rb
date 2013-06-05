# app/controllers/movies_controller.rb  
class MoviesController < ApplicationController
  def show
    aux = Movie.find_by_id(params[:id])
    if aux then
      @movie=Movie.find(params[:id])
    else
      flash[:notice]= "La pelicula solicitada " + params[:id] + " no existe."
      redirect_to movies_path
    end
  end

  def index
    @movies = Movie.all
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movie_path(@movie)
  end

  def edit
    @movie = Movie.find params[:id]
  end
  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
