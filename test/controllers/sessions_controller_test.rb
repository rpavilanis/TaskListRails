require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  def login_a_user
    request.env['omniauth.auth'] = OmniAUth.config.mock_auth[:github]
    get :create, {provider: "github"}
  end

  test “can create a user” do
    assert_difference("User.count", 1) do
       login_a_user
       assert_response :redirect
       assert_redirected_to root_path
       assert_equal session[:user_id], User.find_by(user_id: OmniAuth.config.mock_auth[:github][:uid], provider: "github").id
     end
   end

  # test "if a user logs in twice it doesn't create a 2nd user" do
  #   assert_difference('User.count', 1) do
  #     login_a_user
  #   end
  #   # add more here
  # end


end
