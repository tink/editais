require 'test_helper'

class DocumentoTest < ActiveSupport::TestCase
  should validate_presence_of(:nome)
  should validate_presence_of(:arquivo)
  should validate_presence_of(:data_publicacao)

  should belong_to(:edital)
  should have_many(:downloads)

  test "summary by edital should return the count of completed downloads to each file of an edital" do
    Documento.destroy_all
    Download.destroy_all

    edital = editais(:one)

    file_one = File.open(File.join(Rails.root, 'test', 'fixtures', 'downloads.yml'))
    documento_one = Documento.create(:nome => 'Test 1', :arquivo => file_one, :edital => editais(:one), :data_publicacao => Date.today)

    file_two = File.open(File.join(Rails.root, 'test', 'fixtures', 'documentos.yml'))
    documento_two = Documento.create(:nome => 'Test 2', :arquivo => file_two, :edital => editais(:one), :data_publicacao => Date.today)

    file_three = File.open(File.join(Rails.root, 'test', 'fixtures', 'empresas.yml'))
    documento_three = Documento.create(:nome => 'Test 3', :arquivo => file_three, :edital => editais(:one), :data_publicacao => Date.today)

    documento_of_other_edital = Documento.create(:nome => 'Test 4', :arquivo => file_three, :edital => editais(:two), :data_publicacao => Date.today)

    Download.create(:empresa => empresas(:one), :documento => documento_one, :completed => true)
    Download.create(:empresa => empresas(:two), :documento => documento_one, :completed => false)

    Download.create(:empresa => empresas(:one), :documento => documento_two, :completed => true)
    Download.create(:empresa => empresas(:two), :documento => documento_two, :completed => true)

    result = Documento.downloads_by_edital(edital)
    
    assert_equal 'Test 1', result.first.nome_documento
    assert_equal 1, result.first.quantidade_de_downloads.to_i

    assert_equal 'Test 2', result.second.nome_documento
    assert_equal 2, result.second.quantidade_de_downloads.to_i

    assert_equal 'Test 3', result.third.nome_documento
    assert_equal 0, result.third.quantidade_de_downloads.to_i

    assert_equal 3, result.all.size
  end
end
