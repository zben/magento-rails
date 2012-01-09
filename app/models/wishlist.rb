class Wishlist < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  belongs_to :user
  has_many :wishlist_items
  
  def products
    wishlist_items.map{|item| item.product} 
  end
  
  def find_item product
    wishlist_items.find_by_product_id(product.id)
  end
end
