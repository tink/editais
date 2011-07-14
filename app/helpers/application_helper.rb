module ApplicationHelper
  def flash_message
    messages = ""
    %w(notice info warning error alert).each do |type|
      if flash[type.to_sym]
        messages = content_tag(:div, flash[type.to_sym], :class => "flash-#{type}")
      end
    end
    messages
  end

  def limit_to(string, max_chars)
    if string.size > max_chars
      string[0, max_chars] << '...'
    else
      string
    end
  end

  def wysiwyg_include_tag
    html = javascript_include_tag('jquery.wysiwyg', 'jquery.wysiwyg.link', 'jquery.wysiwyg.table')
    html += stylesheet_link_tag('jquery.wysiwyg.modal', 'jquery.wysiwyg.old-school')
    raw(html)
  end
end
