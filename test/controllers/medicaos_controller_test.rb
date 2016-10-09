require 'test_helper'

class MedicaosControllerTest < ActionController::TestCase
  setup do
    @medicao = medicaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicao" do
    assert_difference('Medicao.count') do
      post :create, medicao: { dataMedicao: @medicao.dataMedicao, medida: @medicao.medida }
    end

    assert_redirected_to medicao_path(assigns(:medicao))
  end

  test "should show medicao" do
    get :show, id: @medicao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicao
    assert_response :success
  end

  test "should update medicao" do
    patch :update, id: @medicao, medicao: { dataMedicao: @medicao.dataMedicao, medida: @medicao.medida }
    assert_redirected_to medicao_path(assigns(:medicao))
  end

  test "should destroy medicao" do
    assert_difference('Medicao.count', -1) do
      delete :destroy, id: @medicao
    end

    assert_redirected_to medicaos_path
  end
end
