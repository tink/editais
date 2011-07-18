# encoding: UTF-8
require 'test_helper'

class EditalTest < ActiveSupport::TestCase
  should_not allow_value("blah").for(:site)
  should allow_value("http://test.com.br").for(:site)

  should validate_presence_of(:nome)
  should validate_presence_of(:resumo)
  should validate_presence_of(:data_publicacao)
  should validate_presence_of(:data_limite)
  should validate_presence_of(:instituicao_id)

  should ensure_length_of(:resumo).is_at_least(10).is_at_most(250)

  should belong_to(:instituicao)
  should have_many(:documentos)

  test "should have tags" do
    edital = create_edital(:tag_list => 'test, another_test, another one')
    assert_equal 3, edital.tags.size
  end

  test "opened" do
    edital_um   = create_edital(:data_limite => Date.today)
    edital_dois = create_edital(:data_limite => Date.today + 3.days)
    edital_tres = create_edital(:data_limite => Date.today - 1.day)

    result = Edital.em_aberto
    assert_equal [edital_um, edital_dois], result
  end

  test "recently finished" do
    Edital.destroy_all

    edital_em_aberto = create_edital(:data_limite => Date.today)

    finalizados = []
    11.times do |counter|
      finalizados << create_edital(:nome => "Finalizado #{counter}", :data_limite => Date.today - (counter + 1).day)
    end

    result = Edital.recentemente_finalizados

    assert !result.include?(edital_em_aberto), "Should not include an opened edital"
    assert_equal finalizados[0, 10], result, "Should return only 10 editais"
  end

  test "should search by part of resumo" do
    expected = create_edital(:resumo => 'Um texto qualquer para o resumo')
    assert_equal [expected], Edital.search(:q => 'qual')
  end

  test "should search by part of description" do
    expected = create_edital(:descricao => 'Uma descrição sobre o edital')
    assert_equal [expected], Edital.search(:q => 'escriçã')
  end

  test "should search by part of nome" do
    expected = create_edital(:nome => 'Edital de abertura da petrobras')
    assert_equal [expected], Edital.search(:q => 'bertur')
  end

  test "should paginate search" do
    assert_respond_to Edital.search, :current_page
  end

  protected
  def create_edital(attributes = {})
    default_attributes = {:nome => 'Com tags', :resumo => 'resumo do edital', :data_publicacao => Date.today, :data_limite => Date.today, :instituicao_id => instituicoes(:one)}

    Edital.create(default_attributes.merge(attributes))
  end
end
