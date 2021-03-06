ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def setup
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] =  OmniAuth::AuthHash.new({provider: 'github', user_id: '123545', info: { email: "a@b.com", name: "Ada"}
    })
  end
  # Add more helper methods to be used by all tests here...
end
