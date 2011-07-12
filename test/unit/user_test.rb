require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:instituicao_id)

  should belong_to(:instituicao)
end
