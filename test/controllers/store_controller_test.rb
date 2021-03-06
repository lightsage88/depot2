require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url("en")
    assert_response :success
    assert_select 'nav.side_nav a', minimum: 4
    assert_select 'main ul.catalog li', 3
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

  test "should show our spanish product" do
    # get store_index_path("es")
      #didn't work :(
    get store_index_url("es")
    assert_response :success
    assert_select 'nav.side_nav a', minimum: 4
    assert_select 'main ul.catalog li', 1


  end

end
