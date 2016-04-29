class MoviesController < ApplicationController
    before_action :authenticate_admin!, except: [:show, :search]
    def new
        @movie = Movie.new
    end
    def search
        if params[:search]
            @results = Movie.search(params[:search])
        else
            @results = Movie.all()
        end
    end
    def index
        @movies = Movie.all
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to @movie, notice: "The movie has been created."
        else
            render 'new'
        end
    end
    def show
        @movie = Movie.find(params[:id])
        #@movie.mratings = Movie.joins(:reviews).average("reviews.ratings")
        @movie.mratings = @movie.reviews.average(:ratings)
    end
    def edit
        @movie = Movie.find(params[:id])
    end
    def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
			redirect_to @movie
		else
			render 'edit'
        end
    end
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to movies_path, notice:  "The poster and #{@movie.title} has been deleted."
    end
    private
        def movie_params
            params.require(:movie).permit(:title, :rdate, :genre, :dname, :actor1, :actor2, :description, :poster)
        end
end
