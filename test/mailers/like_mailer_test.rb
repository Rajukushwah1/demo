require 'test_helper'

class LikeMailerTest < ActionMailer::TestCase
  test "like_created" do
    mail = LikeMailer.like_created
    assert_equal "Like created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
