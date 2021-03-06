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

  test "post verificar should redirect to autenticar if cnpj is invalid" do
    cnpj = '12345678901234'
    post :verificar, :cnpj => cnpj, :e => @edital.id

    assert_redirected_to autenticar_empresas_url(:e => @edital.id)
    assert flash[:error]
  end

  test "post verificar should redirect to new if cnpj is new" do
    cnpj = '89114351000137'
    post :verificar, :cnpj => cnpj, :e => @edital.id

    assert_redirected_to new_empresa_path(:e => @edital.id, :cnpj => cnpj)
  end

  test "post verificar should redirect to editais page if cnpj exists" do
    post :verificar, :cnpj => @empresa.cnpj.to_s

    assert_redirected_to editais_url
  end

  test "post verificar should redirect to edital page if cnpj exists and there is a current edital" do
    post :verificar, :cnpj => @empresa.cnpj.to_s, :e => @edital.id

    assert_redirected_to edital_url(@edital)
  end

  test "should get new" do
    get :new, :e => @edital.id
    assert_response :success
  end

  test "should create empresa" do
    assert_difference('Empresa.count') do
      post :create, :e => @edital.id, :empresa => @empresa.attributes.merge(:email => "test3@test.com", :cnpj => "66.864.642/0001-47")
    end

    assert_redirected_to(@edital)
  end
end
