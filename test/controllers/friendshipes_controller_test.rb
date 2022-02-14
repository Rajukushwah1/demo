require 'test_helper'

class FriendshipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friendshipes_index_url
    assert_response :success
  end

end
