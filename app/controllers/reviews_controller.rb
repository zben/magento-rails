class ReviewsController < ApplicationController

  def create
    x = Product.find(params[:review][:product_id].to_i).reviews.build(params[:review])
    x.update_attribute(:created_at,Time.now)
    x.save
    redirect_to :controller=>:products,:action=>:show, :id=>x.product_id,:q=>:reviews
  end
   
end
