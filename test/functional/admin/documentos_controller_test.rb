require 'test_helper'

class Admin::DocumentosControllerTest < ActionController::TestCase
  setup do
    @edital = editais(:one)
    @documento = documentos(:one)
    @documento.update_attribute(:edital_id, @edital.id)
  end

  test "should get new" do
    get :new, :edital_id => @edital.id
    assert_response :success
  end

  test "should create documento" do
    skip
    assert_difference('Documento.count') do
      post :create, :edital_id => @edital.id, :documento => @documento.attributes
    end

    assert_redirected_to(admin_edital_url(@edital))
  end
  test "should get edit" do
    get :edit, :edital_id => @edital.id, :id => @documento.to_param
    assert_response :success
  end

  test "should update documento" do
    skip
    put :update, :edital_id => @edital.id, :id => @documento.to_param, :documento => @documento.attributes
    assert_redirected_to(admin_edital_url(@edital))
  end

  test "should destroy documento" do
    assert_difference('Documento.count', -1) do
      delete :destroy, :edital_id => @edital.id, :id => @documento.to_param
    end

    assert_redirected_to(admin_edital_url(@edital))
  end
end
