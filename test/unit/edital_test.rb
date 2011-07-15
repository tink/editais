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

  def create_edital(attributes = {})
    default_attributes = {:nome => 'Com tags', :resumo => 'resumo do edital', :data_publicacao => Date.today, :data_limite => Date.today, :instituicao_id => instituicoes(:one)}

    Edital.create(default_attributes.merge(attributes))
  end
end
