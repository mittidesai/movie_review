class WatchlistsController < ApplicationController
    before_action :authenticate_user!
    def index
    end
    def create
        @movie = Movie.find(params[:movie_id])
        @user = User.find(params[:user_id])
        @watchlist = @user.watchlists.create(:movie_id => params[:movie_id])
        redirect_to movie_path(@movie)
    end
 
    def destroy
        @user = User.find(params[:user_id])
        @watchlist = @user.watchlists.find(params[:id])
        @watchlist.destroy
        redirect_to user_watchlists_path(@user)
    end
    
end
