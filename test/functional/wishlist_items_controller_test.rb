require 'test_helper'

class WishlistItemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => WishlistItem.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    WishlistItem.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    WishlistItem.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to wishlist_item_url(assigns(:wishlist_item))
  end

  def test_edit
    get :edit, :id => WishlistItem.first
    assert_template 'edit'
  end

  def test_update_invalid
    WishlistItem.any_instance.stubs(:valid?).returns(false)
    put :update, :id => WishlistItem.first
    assert_template 'edit'
  end

  def test_update_valid
    WishlistItem.any_instance.stubs(:valid?).returns(true)
    put :update, :id => WishlistItem.first
    assert_redirected_to wishlist_item_url(assigns(:wishlist_item))
  end

  def test_destroy
    wishlist_item = WishlistItem.first
    delete :destroy, :id => wishlist_item
    assert_redirected_to wishlist_items_url
    assert !WishlistItem.exists?(wishlist_item.id)
  end
end
