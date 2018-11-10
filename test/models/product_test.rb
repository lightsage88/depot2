require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

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
      title: "SomeBookThatIsAtLeast10CharsLong",
      description: "Pages with stuff",
      image_url: "snore.jpg"              
    )
    product.price = -2 
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
    product.errors[:price]
    #in 24/25 we assert that the string presented will be the 
    #error message assocated with [:price]///which you can see in the
    #model file!
      product.price = 1
      assert product.valid?
    end

    test "that image_url ends in the right type" do
      def new_product(image_url)
        product = Product.new(
          title: "Some other book",
          description: "yet another book",
          price: 1,
          image_url: image_url
        )
      end
      ok = %w{fred.gif mickey.gif joe.png joe.jpg}
      bad = %w{fred.gif.sam mick.mi sollocho.jpeg.jpg.fig }
      
      ok.each do |image_url|
        assert new_product(image_url).valid?
      end

      bad.each do |image_url|
        assert new_product(image_url).invalid?
      end

    end

    test "that product is not valid unless it has a unique title" do
      copy_product = Product.new(
        title: products(:ruby).title,
        price: 1,
        description: "another book about a gem or something",
        image_url: "mgs1.jpg"
      )
      
      assert copy_product.invalid?
      assert_equal ["has already been taken"], copy_product.errors[:title]
    end

    test "that we have changed the title validation message" do
      product = Product.new(
        title: "bb",
        price: 1,
        description: "meh",
        image_url: "mgs1.jpg"
      )
      assert product.invalid?
      assert_equal ["This is too dang short, dog"], product.errors[:title]
    end
end
