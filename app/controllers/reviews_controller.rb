class ReviewsController < ApplicationController
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
 
  private
    def review_params
      params.require(:review).permit(:text, :ratings)
    end
end
