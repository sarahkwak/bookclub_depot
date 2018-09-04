require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(
      title: "whatever",
      description: "whatever",
      image_url: "whatever.jpg",
      price: 0
    )
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1.00
    assert product.invalid?
  end

  test "product title must be greater than 10" do
    product = Product.new(
      title: "hi",
      description: "whatever",
      image_url: "whatever.jpg",
      price: 2
    )
    assert product.invalid?
    assert_equal ["is too short (minimum is 10 characters)"], product.errors[:title]
  end
end
