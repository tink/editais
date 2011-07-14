require 'test_helper'

class Admin::RelatoriosControllerTest < ActionController::TestCase
  setup do
    @edital = editais(:one)

    sign_in :user, users(:one)
  end

  test "GET downloads_por_edital" do
    get :downloads_por_edital, :id => @edital.id

    assert_response :success
    assert_equal @edital, assigns(:edital)
    assert assigns(:resumo_downloads)
    assert assigns(:empresas)
  end
end
