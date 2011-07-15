require 'test_helper'

class Admin::ConfiguracoesControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in :user, @user
  end

  test "GET editar_senha" do
    get :editar_senha
    assert_response :success
  end

  test "PUT alterar_senha with valid params" do
    put :alterar_senha, :user => {:current_password => '123456', :password => '654321', :password_confirmation => '654321'}

    assert_equal 'Senha atualizada com sucesso!', flash[:notice]
    assert_redirected_to admin_editar_senha_url
  end

  test "PUT alterar_senha with invalid params" do
    put :alterar_senha, :user => {:current_password => '123456', :password => 'asdasd', :password_confirmation => '654321'}
    assert_template :editar_senha
  end
end
