require 'test_helper'

class DocumentoTest < ActiveSupport::TestCase
  should validate_presence_of(:nome)
  should validate_presence_of(:arquivo)
  should validate_presence_of(:data_publicacao)

  should belong_to(:edital)
end
