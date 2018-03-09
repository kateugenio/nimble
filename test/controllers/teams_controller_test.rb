require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get backlog" do
    get teams_backlog_url
    assert_response :success
  end

end
