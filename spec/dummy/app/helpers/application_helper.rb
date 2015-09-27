module ApplicationHelper
  def flash_message
    flash.map do |key, msg|
      content_tag(:div, msg, :id => key, :class => 'flash')
    end.join.html_safe
  end
end
