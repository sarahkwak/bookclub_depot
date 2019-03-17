require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  test "User order the product and receive email" do
    start_order_count = Order.count
    ruby_book = products(:ruby)

    get "/"
    assert_response :success
    assert_select 'h1', "Your Pragmatic Catalog"

    post '/line_items', params: { product_id: ruby_book.id }, xhr: true
    assert_response :success
    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal ruby_book, cart.line_items[0].product

    get "/orders/new"
    assert_response :success
    assert_select 'legend', 'Please Enter Your Details'

    post "/orders", params: {
      id: ruby_book.id,
      order: {
        name: "sarah kwak",
        address: "223 Market Street",
        email: "fake@email.com",
        pay_type: "Credit card"
      }
    }
    follow_redirect!
    assert_response :success
    assert_select 'h1', "Your Pragmatic Catalog"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size
    # the spec break because mail doesn't set correctly
    mails = ActionMailer::Base.deliveries
    sleep 0.4
    assert_equal ["fake@email.com"], mails.last.to
  end
end
