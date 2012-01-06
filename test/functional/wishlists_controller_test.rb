require 'test_helper'

class WishlistsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Wishlist.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Wishlist.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Wishlist.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to wishlist_url(assigns(:wishlist))
  end

  def test_edit
    get :edit, :id => Wishlist.first
    assert_template 'edit'
  end

  def test_update_invalid
    Wishlist.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Wishlist.first
    assert_template 'edit'
  end

  def test_update_valid
    Wishlist.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Wishlist.first
    assert_redirected_to wishlist_url(assigns(:wishlist))
  end

  def test_destroy
    wishlist = Wishlist.first
    delete :destroy, :id => wishlist
    assert_redirected_to wishlists_url
    assert !Wishlist.exists?(wishlist.id)
  end
end
