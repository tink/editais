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
    tags = 'test, another_test, another one'
    edital = Edital.create(:tag_list => tags, :nome => 'Com tags', :resumo => 'resumo do edital', :data_publicacao => Date.today, :data_limite => Date.today, :instituicao_id => instituicoes(:one))

    assert_equal 3, edital.tags.size
  end
end
