require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointments" do
    assert_difference('Appointments.count') do
      post :create, :appointments => { }
    end

    assert_redirected_to appointments_path(assigns(:appointments))
  end

  test "should show appointments" do
    get :show, :id => appointments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => appointments(:one).to_param
    assert_response :success
  end

  test "should update appointments" do
    put :update, :id => appointments(:one).to_param, :appointments => { }
    assert_redirected_to appointments_path(assigns(:appointments))
  end

  test "should destroy appointments" do
    assert_difference('Appointments.count', -1) do
      delete :destroy, :id => appointments(:one).to_param
    end

    assert_redirected_to appointments_path
  end
end
