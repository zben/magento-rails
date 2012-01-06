class CreateWishlistItems < ActiveRecord::Migration
  def self.up
    create_table :wishlist_items do |t|
      t.integer :product_id
      t.integer :wishlist_id
      t.timestamps
    end
  end

  def self.down
    drop_table :wishlist_items
  end
end
