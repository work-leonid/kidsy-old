require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get affirmation" do
    get static_affirmation_url
    assert_response :success
  end
end
