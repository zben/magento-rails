class WishlistItem < ActiveRecord::Base
  attr_accessible :product_id, :wishlist_id
  
  belongs_to :wishlist
  
  def product 
    Product.find(product_id)
  end
end
