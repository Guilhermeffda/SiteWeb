require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    order = orders(:one)  
    

    order.line_items.create!(
      product: products(:ruby), 
      quantity: 1
    )
    
    mail = OrderMailer.shipped(order)
    assert_equal "Order Shipped", mail.subject
    assert_equal [order.email], mail.to
    assert_match /Programming Ruby 1.9/, mail.body.encoded 
  end
end