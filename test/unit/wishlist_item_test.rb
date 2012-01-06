require 'test_helper'

class WishlistItemTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert WishlistItem.new.valid?
  end
end
