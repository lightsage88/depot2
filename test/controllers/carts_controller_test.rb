require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get carts_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_url
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post carts_url, params: { cart: {  } }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test "should show cart" do
    get cart_url(@cart)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_url(@cart)
    assert_response :success
  end

  test "should update cart" do
    patch cart_url(@cart), params: { cart: {  } }
    assert_redirected_to cart_url(@cart)
  end

  test "should add an item and then delete it" do
    assert_difference('Cart.count', 1) do
    post line_items_url, params: { product_id: products(:ruby).id }
    end
    
    # # puts @cart.products
    # assert_difference('Cart.count', 0) do
    # delete line_item_url(@cart.line_item)
    # end
    #TODO: Can't figure out how to get the line_item I made in this cart...
    #need some help to figure out how to make this flow properly :( 
  end

  test "should destroy cart" do
    post line_items_url, params: {product_id: products(:ruby).id }
    @cart = Cart.find(session[:cart_id])
    assert_difference('Cart.count', -1) do
      delete cart_url(@cart)
    end

    assert_redirected_to store_index_url
  end
end
