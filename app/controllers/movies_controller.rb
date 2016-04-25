class MoviesController < ApplicationController
    def new
        @movie = Movie.new
    end

    def index
        @movies = Movie.all
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to @movie
        else
            render 'new'
        end
    end
    def show
        @movie = Movie.find(params[:id])
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
        redirect_to movies_path
    end
    def upload
        uploaded_io = params[:id][:poster]
        File.open(Rails.root.join('public', 'uploads', 'movies', uploaded_io.original_filename), 'wb') do |file|
            file.write(uploaded_io.read)
        end
    end
    private
        def movie_params
            params.require(:movie).permit(:title, :rdate, :genre, :dname, :actor1, :actor2, :description, :poster)
        end
end
