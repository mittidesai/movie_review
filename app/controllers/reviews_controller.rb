class ReviewsController < ApplicationController
    #respond_to :html, :xml, :json
    #before_action :authenticate_user!
    def create
        #@user = User.find(email: current_user.emai)
        #@review = @user.reviews.create(review_params)
        @movie = Movie.find(params[:movie_id])
        @review = @movie.reviews.create(review_params)
        @review.update(user_email: current_user.email);
        redirect_to movie_path(@movie)
    end
    def destroy
        @movie = Movie.find(params[:movie_id])
        @review = @movie.reviews.find(params[:id])
        @review.destroy
        redirect_to movie_path(@movie)
    end
    def user
       # @movies = Movie.all
    #    @reviews = []
    #    @movies.each do |movie|
    #        temp = movie.reviews.where(["user_email LIKE ?", params[:user_email]])
    #        @reviews += temp if temp
    #    end
    #    respond_with(@reviews)
    end
  private
    def review_params
      params.require(:review).permit(:text, :ratings)
    end
end
