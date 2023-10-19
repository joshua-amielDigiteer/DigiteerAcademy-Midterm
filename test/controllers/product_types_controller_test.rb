require "test_helper"

class ProductTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_types_index_url
    assert_response :success
  end

  test "should get new" do
    get product_types_new_url
    assert_response :success
  end

  test "should get show" do
    get product_types_show_url
    assert_response :success
  end

  test "should get create" do
    get product_types_create_url
    assert_response :success
  end

  test "should get edit" do
    get product_types_edit_url
    assert_response :success
  end

  test "should get update" do
    get product_types_update_url
    assert_response :success
  end

  test "should get destroy" do
    get product_types_destroy_url
    assert_response :success
  end
end
