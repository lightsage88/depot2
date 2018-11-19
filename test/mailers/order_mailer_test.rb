require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Gratitude from Fox Hound!", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end
  
  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "FoxHound Item Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td[^>]*>1<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

  test "store_error_mail" do
    mail = OrderMailer.store_error_mail(orders(:one))
    assert_equal "Houston, we have a problem!", mail.subject
    assert_equal ["adrian.e.rosales@gmail.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match "we aren't getting our money", mail.body.encoded

  end

end
