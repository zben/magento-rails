class WishlistsController < ApplicationController
  def index
    @wishlists = Wishlist.all
  end

  def show
    @wishlist = Wishlist.find(params[:id])
    @wishlist_items = @wishlist.wishlist_items
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = current_user.wishlists.build(params[:wishlist])
    if @wishlist.save
      redirect_to root_path, :notice => "Successfully created wishlist."
    else
      render :action => 'new'
    end
  end

  def edit
    @wishlist = Wishlist.find(params[:id])
  end

  def update
    @wishlist = Wishlist.find(params[:id])
    if @wishlist.update_attributes(params[:wishlist])
      redirect_to @wishlist, :notice  => "Successfully updated wishlist."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    redirect_to root_path, :notice => "Successfully destroyed wishlist."
  end
end
