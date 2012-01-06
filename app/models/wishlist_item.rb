class WishlistItem < ActiveRecord::Base
  attr_accessible :product_id, :wishlist_id
  
  belongs_to :wishlist
  
  def product 
    Product.new(product_id)
  end
end
