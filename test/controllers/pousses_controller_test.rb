require 'test_helper'

class PoussesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pousses_index_url
    assert_response :success
  end

  test "should get show" do
    get pousses_show_url
    assert_response :success
  end

  test "should get new" do
    get pousses_new_url
    assert_response :success
  end

  test "should get create" do
    get pousses_create_url
    assert_response :success
  end

  test "should get edit" do
    get pousses_edit_url
    assert_response :success
  end

  test "should get update" do
    get pousses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pousses_destroy_url
    assert_response :success
  end

end
