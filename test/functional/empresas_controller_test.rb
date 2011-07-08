require 'test_helper'

class EmpresasControllerTest < ActionController::TestCase
  setup do
    @edital = editais(:one)
    @empresa = empresas(:one)
  end

  test "should get autenticar" do
    get :autenticar, :e => @edital.id
    assert_response :success
  end

  test "post verificar should redirect to new if cnpj is new" do
    cnpj = '12345678901234'
    post :verificar, :cnpj => cnpj, :e => @edital.id

    assert_redirected_to new_empresa_path, :empresa => {:cnpj => cnpj}
  end

  test "post verificar should redirect to edital page if cnpj exists" do
    post :verificar, :cnpj => @empresa.cnpj, :e => @edital.id

    assert_redirected_to edital_url(@edital)
  end

  test "should get new" do
    get :new, :e => @edital.id
    assert_response :success
  end

  test "should create empresa" do
    assert_difference('Empresa.count') do
      post :create, :e => @edital.id, :empresa => @empresa.attributes
    end

    assert_redirected_to empresa_path(assigns(:empresa))
  end
end
