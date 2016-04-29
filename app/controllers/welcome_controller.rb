class WelcomeController < ApplicationController
  def index
      @latests = Movie.latest
  end
end
