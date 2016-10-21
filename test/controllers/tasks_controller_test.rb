require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test "Make sure a user can see their tasks." do
    session[:user_id] = users(:ada).id
    get :show, id: tasks(:adas_task).id

    assert_response :success

  end

  test "Make sure a user cannot see another user's tasks." do
    session[:user_id] = users(:lisa).id
    get :show, id: tasks(:adas_task).id

    assert_response :redirect
    assert_equal flash[:notice], "You do not have access to that task."
  end

  #
  # test "should get index" do
  #   get :index
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end
  #
  # test "should get delete" do
  #   get :delete
  #   assert_response :success
  # end
  #
  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

end
