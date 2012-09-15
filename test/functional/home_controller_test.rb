require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get confirm" do
    get :confirm
    assert_response :success
  end

  test "should get weeding" do
    get :weeding
    assert_response :success
  end

  test "should get presents" do
    get :presents
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
