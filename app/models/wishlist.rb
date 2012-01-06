class Wishlist < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  belongs_to :user
  has_many :wishlist_items
end
