require 'test_helper'

class InstituicaoTest < ActiveSupport::TestCase
  should validate_presence_of(:nome)
  should validate_uniqueness_of(:nome)
end
