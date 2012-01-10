class ReviewsController < ApplicationController

  def create
    Review.create(params[:review])
    redirect_to :back
  end
   
end
