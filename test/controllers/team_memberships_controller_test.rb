require 'test_helper'

class TeamMembershipsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get team_memberships_show_url
    assert_response :success
  end

  test "should get create" do
    get team_memberships_create_url
    assert_response :success
  end

  test "should get destroy" do
    get team_memberships_destroy_url
    assert_response :success
  end

end
