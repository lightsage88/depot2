require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do 
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any? 
    assert product.errors[:price].any? 
    assert product.errors[:image_url].any?
    end

    test "price works as it should" do
    product = Product.new(
      title: "Some book",
      description: "Pages with stuff",
      image_url: "snore.jpg"              
    )
    product.price = -2 
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    product.errors[:price]
      product.price = 1
      assert product.valid?
    end
end
