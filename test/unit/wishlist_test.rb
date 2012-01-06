require 'test_helper'

class WishlistTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Wishlist.new.valid?
  end
end
