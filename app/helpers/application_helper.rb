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
end
