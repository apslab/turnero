require 'test_helper'

class NumeratorsControllerTest < ActionController::TestCase
  setup do
    @numerator = numerators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:numerators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create numerator" do
    assert_difference('Numerator.count') do
      post :create, numerator: @numerator.attributes
    end

    assert_redirected_to numerator_path(assigns(:numerator))
  end

  test "should show numerator" do
    get :show, id: @numerator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @numerator
    assert_response :success
  end

  test "should update numerator" do
    put :update, id: @numerator, numerator: @numerator.attributes
    assert_redirected_to numerator_path(assigns(:numerator))
  end

  test "should destroy numerator" do
    assert_difference('Numerator.count', -1) do
      delete :destroy, id: @numerator
    end

    assert_redirected_to numerators_path
  end
end
