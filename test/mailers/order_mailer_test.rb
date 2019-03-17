require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal [orders(:one).email], mail.to
    assert_equal ["sarahseyoungkwak@gmail.com"], mail.from
    assert_match "we received your order", mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Your order has been shipped", mail.subject
    assert_equal [orders(:one).email], mail.to
    assert_equal ["sarahseyoungkwak@gmail.com"], mail.from
    assert_match "we've shipped your recent order", mail.body.encoded
  end

end
