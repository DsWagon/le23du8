require "test_helper"

class VipControllerTest < ActionDispatch::IntegrationTest
  test "should get indexshow" do
    get vip_indexshow_url
    assert_response :success
  end

  test "should get edit" do
    get vip_edit_url
    assert_response :success
  end

  test "should get update" do
    get vip_update_url
    assert_response :success
  end

  test "should get destroy" do
    get vip_destroy_url
    assert_response :success
  end
end
