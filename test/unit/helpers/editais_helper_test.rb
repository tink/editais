require 'test_helper'

class EditaisHelperTest < ActionView::TestCase
  test "#links_to_tags should return links for each tag on editais" do
    expected_result = [link_to("teste", palavras_chave_url("teste"), :class => 'palavra-chave')]
    expected_result << link_to("outro", palavras_chave_url("outro"), :class => 'palavra-chave')
    expected_result << link_to("mais outro", palavras_chave_url("mais outro"), :class => 'palavra-chave')
    expected_result = expected_result.join(', ')

    tags = [ActsAsTaggableOn::Tag.new(name: "teste"), ActsAsTaggableOn::Tag.new(name: "outro"), ActsAsTaggableOn::Tag.new(name: "mais outro")]
    result = links_to_tags(tags)
    assert_equal expected_result, result
  end
end
