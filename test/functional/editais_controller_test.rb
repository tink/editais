require 'test_helper'

class EditaisControllerTest < ActionController::TestCase
  setup do
    @edital = editais(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editais)
  end

  test "should show edital" do
    get :show, :id => @edital.to_param
    assert_response :success
  end
end
