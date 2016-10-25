require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'users must have email' do
    assert(users(:normal_user).valid?)
    assert_not(users(:user_without_email).valid?)
  end

  test 'users must have name' do
    assert(users(:normal_user).valid?)
    assert_not(users(:user_without_name).valid?)
  end

  test 'users must have provider' do
    assert(users(:normal_user).valid?)
    assert_not(users(:user_without_provider).valid?)
  end

  test 'if an email is added to a user w/o email, it should become valid' do
    user = users(:user_without_email)
    assert_not(user.valid?)

    user.email = "lisa@gmail.com"
    assert(user.valid?)
  end

  test 'new users created without emails are not valid' do
    user = User.new(name: "Matthew", id: 4, user_id: 12327, provider: 'github')
    assert_not(user.valid?)
  end

  test 'user emails should be unique' do
    user = users(:user_without_email)
    user.email = "linda@adadevelopersacademy.org"
    assert_not(user.valid?)
  end

end
