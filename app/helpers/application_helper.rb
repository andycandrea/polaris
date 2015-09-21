module ApplicationHelper
  def fa_icon_string(icon, text = icon.titleize)
    "#{fa_icon icon} #{text}".html_safe
  end
end
