require 'test_helper'

class InstituicaoTest < ActiveSupport::TestCase
  should validate_presence_of(:nome)
  should validate_uniqueness_of(:nome)

  should have_many(:editais)
  should have_many(:users)
end
