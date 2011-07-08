require 'test_helper'

class EmpresaTest < ActiveSupport::TestCase
  should validate_presence_of(:razao_social)
  should validate_presence_of(:telefone_1)
  should validate_presence_of(:email)
  should validate_presence_of(:endereco)
  should validate_presence_of(:responsavel)
  should validate_presence_of(:cnpj)

  should validate_uniqueness_of(:email)
  should validate_uniqueness_of(:cnpj)

  test "should not accept invalid cnpj" do
    empresa = Empresa.new
    empresa.cnpj = '1sjasodijoasd0'

    assert empresa.invalid?
    assert_present empresa.errors[:cnpj]
  end

  test "should accept a valid cnpj" do
    empresa = Empresa.new
    empresa.cnpj = '53419322000136'

    empresa.valid?
    assert_blank empresa.errors[:cnpj]
  end
end
