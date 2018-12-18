require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "#add_product" do
    cart = Cart.create
    product = products(:one)
    assert_difference('cart.line_items.count') do
      cart.add_product(product)
    end
  end
end
