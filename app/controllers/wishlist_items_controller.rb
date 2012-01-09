class WishlistItemsController < ApplicationController
  def index
    @wishlist = Wishlist.find(params[:wishlist_id])
    @wishlist_items = @wishlist.wishlist_items
  end

  def show
    @wishlist_item = WishlistItem.find(params[:id])
  end

  def new
    @wishlist = Wishlist.find(params[:wishlist_id])
    @wishlist_item = @wishlist.wishlist_items.build
  end

  def create
    if !params[:product_id].nil?
      Wishlist.find(params[:wishlist_id]).wishlist_items.build(:product_id=>params[:product_id]).save
      redirect_to :back
    else
      @wishlist_item = WishlistItem.new(params[:wishlist_item])
      if @wishlist_item.save
        redirect_to @wishlist_item, :notice => "Successfully created wishlist item."
      else
        render :action => 'new'
      end
    end
  end

  def edit
    @wishlist_item = WishlistItem.find(params[:id])
  end

  def update
    @wishlist_item = WishlistItem.find(params[:id])
    if @wishlist_item.update_attributes(params[:wishlist_item])
      redirect_to @wishlist_item, :notice  => "Successfully updated wishlist item."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    @wishlist_item.destroy
    redirect_to :back, :notice => "Successfully destroyed wishlist item."
  end
end
