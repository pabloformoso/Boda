require 'test_helper'

class Admin::GuestsControllerTest < ActionController::TestCase
  setup do
    @admin_guest = admin_guests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_guests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_guest" do
    assert_difference('Admin::Guest.count') do
      post :create, admin_guest: { city: @admin_guest.city, has_confirmed: @admin_guest.has_confirmed, lastname: @admin_guest.lastname, name: @admin_guest.name, number_of_companions: @admin_guest.number_of_companions }
    end

    assert_redirected_to admin_guest_path(assigns(:admin_guest))
  end

  test "should show admin_guest" do
    get :show, id: @admin_guest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_guest
    assert_response :success
  end

  test "should update admin_guest" do
    put :update, id: @admin_guest, admin_guest: { city: @admin_guest.city, has_confirmed: @admin_guest.has_confirmed, lastname: @admin_guest.lastname, name: @admin_guest.name, number_of_companions: @admin_guest.number_of_companions }
    assert_redirected_to admin_guest_path(assigns(:admin_guest))
  end

  test "should destroy admin_guest" do
    assert_difference('Admin::Guest.count', -1) do
      delete :destroy, id: @admin_guest
    end

    assert_redirected_to admin_guests_path
  end
end
