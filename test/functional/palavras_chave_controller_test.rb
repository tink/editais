require 'test_helper'

class PalavrasChaveControllerTest < ActionController::TestCase
  setup do
    @edital = editais(:one)
    @edital.tag_list = 'outro, nova'
    @edital.save
  end

  test "should show" do
    get :show, :id => 'outro'
    assert_response :success
    assert_equal [@edital], assigns(:editais)
  end
end
