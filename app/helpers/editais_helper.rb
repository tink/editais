module EditaisHelper
  def links_to_tags(tags)
    tag_links = []
    tags.each do |tag_object|
      tag_links << link_to(tag_object.name, palavras_chave_url(tag_object.name), :class => 'palavra-chave')
    end
    raw tag_links.join(', ')
  end
end
