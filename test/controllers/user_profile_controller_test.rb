require 'test_helper'

class UserProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_profile_show_url
    assert_response :success
  end

end
