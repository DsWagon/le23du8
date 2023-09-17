require "test_helper"

class CommentarysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commentarys_index_url
    assert_response :success
  end

  test "should get show" do
    get commentarys_show_url
    assert_response :success
  end

  test "should get new" do
    get commentarys_new_url
    assert_response :success
  end

  test "should get create" do
    get commentarys_create_url
    assert_response :success
  end

  test "should get edit" do
    get commentarys_edit_url
    assert_response :success
  end

  test "should get update" do
    get commentarys_update_url
    assert_response :success
  end

  test "should get destroy" do
    get commentarys_destroy_url
    assert_response :success
  end
end
