require 'test_helper'

class EmpresaTest < ActiveSupport::TestCase
  should validate_presence_of(:razao_social)
  should validate_presence_of(:telefone_1)
  should validate_presence_of(:email)
  should validate_presence_of(:endereco)
  should validate_presence_of(:responsavel)
  should validate_presence_of(:cnpj)
end
