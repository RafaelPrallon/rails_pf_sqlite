require 'test_helper'

class MedidorsControllerTest < ActionController::TestCase
  setup do
    @medidor = medidors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medidors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medidor" do
    assert_difference('Medidor.count') do
      post :create, medidor: { estadoMedidor: @medidor.estadoMedidor, local_id: @medidor.local_id }
    end

    assert_redirected_to medidor_path(assigns(:medidor))
  end

  test "should show medidor" do
    get :show, id: @medidor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medidor
    assert_response :success
  end

  test "should update medidor" do
    patch :update, id: @medidor, medidor: { estadoMedidor: @medidor.estadoMedidor, local_id: @medidor.local_id }
    assert_redirected_to medidor_path(assigns(:medidor))
  end

  test "should destroy medidor" do
    assert_difference('Medidor.count', -1) do
      delete :destroy, id: @medidor
    end

    assert_redirected_to medidors_path
  end
end
