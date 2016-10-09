require 'test_helper'

class BuscasControllerTest < ActionController::TestCase
  setup do
    @busca = buscas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buscas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create busca" do
    assert_difference('Busca.count') do
      post :create, busca: { data_fim: @busca.data_fim, data_hora_fim: @busca.data_hora_fim, data_hora_inicio: @busca.data_hora_inicio, data_inicio: @busca.data_inicio }
    end

    assert_redirected_to busca_path(assigns(:busca))
  end

  test "should show busca" do
    get :show, id: @busca
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @busca
    assert_response :success
  end

  test "should update busca" do
    patch :update, id: @busca, busca: { data_fim: @busca.data_fim, data_hora_fim: @busca.data_hora_fim, data_hora_inicio: @busca.data_hora_inicio, data_inicio: @busca.data_inicio }
    assert_redirected_to busca_path(assigns(:busca))
  end

  test "should destroy busca" do
    assert_difference('Busca.count', -1) do
      delete :destroy, id: @busca
    end

    assert_redirected_to buscas_path
  end
end
