class WishlistItem < ActiveRecord::Base
  attr_accessible :product_id, :wishlist_id
  
  belongs_to :wishlist
  
  def product 
    MagentoAPI.call 'product.info',:string=>product_id
  end
end
