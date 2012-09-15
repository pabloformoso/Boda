require 'test_helper'

class Admin::AccessRequestsControllerTest < ActionController::TestCase
  setup do
    @admin_access_request = admin_access_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_access_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_access_request" do
    assert_difference('Admin::AccessRequest.count') do
      post :create, admin_access_request: { email: @admin_access_request.email, name: @admin_access_request.name, revised: @admin_access_request.revised }
    end

    assert_redirected_to admin_access_request_path(assigns(:admin_access_request))
  end

  test "should show admin_access_request" do
    get :show, id: @admin_access_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_access_request
    assert_response :success
  end

  test "should update admin_access_request" do
    put :update, id: @admin_access_request, admin_access_request: { email: @admin_access_request.email, name: @admin_access_request.name, revised: @admin_access_request.revised }
    assert_redirected_to admin_access_request_path(assigns(:admin_access_request))
  end

  test "should destroy admin_access_request" do
    assert_difference('Admin::AccessRequest.count', -1) do
      delete :destroy, id: @admin_access_request
    end

    assert_redirected_to admin_access_requests_path
  end
end
