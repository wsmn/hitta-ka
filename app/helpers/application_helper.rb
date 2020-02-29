# frozen_string_literal: true

module ApplicationHelper
  def nav_active?(actions)
    name = "#{controller_name}##{action_name}"
    actions.include?(name)
  end

  def sidebar_link(active, path, icon: nil, text: "", icon_class: "w-10 inline-block text-center", link_class: "px-2 py-3 flex items-center text-white hover:bg-gray-700")
    content = []
    if icon
      content << content_tag(:div, class: icon_class) {
        icon("fas", icon, class: "mt-1")
      }
    end
    content << content_tag(:span, text, class: "font-light")
    link_to(path, class: link_class) do
      if block_given?
        yield
      else
        content.join.html_safe
      end
    end
  end

  def header_active(target, base, extra)
    css = base
    if nav_active?(target)
      css += " #{extra}"
    end
    css
  end
end
