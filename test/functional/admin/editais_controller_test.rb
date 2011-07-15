require 'test_helper'

class Admin::EditaisControllerTest < ActionController::TestCase
  setup do
    @edital = editais(:one)

    sign_in :user, users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editais)
    assert_respond_to assigns(:editais), :current_page
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create edital" do
    assert_difference('Edital.count') do
      post :create, :edital => @edital.attributes
    end

    assert_equal 'Edital criado com sucesso. Adicione agora o primeiro arquivo referente a este edital.', flash[:notice]
    assert_redirected_to new_admin_edital_documento_path(:edital_id => assigns(:edital).id)
  end

  test "should show edital" do
    get :show, :id => @edital.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @edital.to_param
    assert_response :success
  end

  test "should update edital" do
    put :update, :id => @edital.to_param, :edital => @edital.attributes
    assert_redirected_to admin_edital_path(assigns(:edital))
  end

  test "should destroy edital" do
    assert_difference('Edital.count', -1) do
      delete :destroy, :id => @edital.to_param
    end

    assert_redirected_to admin_editais_path
  end
end
