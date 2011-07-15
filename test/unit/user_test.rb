require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:instituicao_id)

  should belong_to(:instituicao)

  test "update password with invalid current_password" do
    user = users(:one)
    assert ! user.update_password(:current_password => 'INVALID PASS', :password => 'asdasd', :password_confirmation => 'asdasd')
    assert_present user.errors[:current_password]
  end

  test "update password with invalid password_confirmation" do
    user = users(:one)
    assert ! user.update_password(:current_password => '123456', :password => 'asdasd', :password_confirmation => 'INVALID PASS')
    assert_present user.errors[:password]
  end

  test "update password with valid params" do
    user = users(:one)
    assert user.update_password(:current_password => '123456', :password => 'asdasd', :password_confirmation => 'asdasd')
    assert_blank user.errors
  end
end
