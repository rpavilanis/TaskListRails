require 'test_helper'

class SessionscreateControllerTest < ActionController::TestCase
  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
