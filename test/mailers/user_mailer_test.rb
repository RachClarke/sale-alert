require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "price_change" do
    mail = UserMailer.price_change
    assert_equal "Price change", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
