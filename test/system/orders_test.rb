require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit orders_url
  #
  #   assert_selector "h1", text: "Order"
  # end

  test "check routing number" do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    click_on "Checkout"

    fill_in 'order_name', with: "Earl Simmons"
    fill_in 'order_address', with: "666 Yonkers Way"
    fill_in 'order_email', with: 'dmx@ruffryders.com'

    assert_no_selector "#order_routing_number"

    select 'Check', from: 'pay_type'

    assert_selector "#order_routing_number"
  end
################
  test "check credit card number" do
    visit store_index_url
    first('.catalog li').click_on 'Add to Cart'
    click_on "Checkout"
    fill_in 'order_name', with: "Earl Simmons"
    fill_in 'order_address', with: "666 Yonkers Way"
    fill_in 'order_email', with: 'dmx@ruffryders.com'
    assert_no_selector "#order_credit_card_number"
    select 'Credit card', from: "pay_type"
    assert_selector "#order_credit_card_number"
  end
###############
  test "check purchase order" do
    visit store_index_url
    first('.catalog li').click_on 'Add to Cart'
    click_on "Checkout"
    fill_in 'order_name', with: "Earl Simmons"
    fill_in 'order_address', with: "666 Yonkers Way"
    fill_in 'order_email', with: 'dmx@ruffryders.com'
    assert_no_selector "#order_po_number"
    select "Purchase order", from: "pay_type"
    assert_selector "#order_po_number"
  end
##############
  test "that Add to Cart reveals the cart" do
    visit store_index_url
    assert_no_selector "#cart article"
    first('.catalog li').click_on 'Add to Cart'
    assert_selector "#cart article"
  end
#############
  test "that Empty Cart hides the cart" do
    visit store_index_url
    assert_no_selector "#cart article"
    first('.catalog li').click_on 'Add to Cart'
    assert_selector "#cart article"
    click_on "Empty cart"
    page.driver.browser.switch_to.alert.accept

    assert_no_selector "#cart article"
  end
#########
  test "clicking on an image will make a flash appear in the cart" do
    visit store_index_url
    assert_no_selector "#cart article"
    first('.catalog li').click_on 'Add to Cart'
    assert_selector ".line-item-highlight"
    # ".line-item-hightlight".assert_style("background" =>  "#8f8")
    assert_selector "#cart article"

  end




end
