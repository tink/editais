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

  should have_many(:downloads)

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

  test "how has downloaded a file from a edital" do
    Documento.destroy_all
    Download.destroy_all

    empresa_one = empresas(:one)
    empresa_two = empresas(:two)

    edital_one = editais(:one)
    edital_two = editais(:two)

    file_one = File.open(File.join(Rails.root, 'test', 'fixtures', 'downloads.yml'))
    file_two = File.open(File.join(Rails.root, 'test', 'fixtures', 'documentos.yml'))

    documento_one = Documento.create(:nome => 'Test 1', :arquivo => file_one, :edital => editais(:one), :data_publicacao => Date.today)
    documento_two = Documento.create(:nome => 'Test 2', :arquivo => file_two, :edital => editais(:one), :data_publicacao => Date.today)

    Download.create(:empresa => empresa_one, :documento => documento_one, :completed => true)
    Download.create(:empresa => empresa_two, :documento => documento_two, :completed => true)

    documento_three = Documento.create(:nome => 'Test 3', :arquivo => file_one, :edital => edital_two, :data_publicacao => Date.today)
    documento_four = Documento.create(:nome => 'Test 3', :arquivo => file_two, :edital => edital_two, :data_publicacao => Date.today)

    Download.create(:empresa => empresa_one, :documento => documento_three, :completed => false)
    Download.create(:empresa => empresa_two, :documento => documento_three, :completed => true)
    Download.create(:empresa => empresa_two, :documento => documento_four, :completed => true)

    result_for_edital_one = Empresa.that_download_an_edital(edital_one)
    assert_equal [empresa_one, empresa_two], result_for_edital_one

    result_for_edital_two = Empresa.that_download_an_edital(edital_two)
    assert_equal [empresa_two], result_for_edital_two
  end
end
