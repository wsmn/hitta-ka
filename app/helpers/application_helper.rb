# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  def nav_active?(actions)
    name = "#{controller_name}##{action_name}"
    actions.include?(name)
  end

  def header_active(target, base, extra)
    css = base
    if nav_active?(target)
      css += " #{extra}"
    end
    css
  end

  def sidebar_link(action, url, css: "mt-2 -mx-3 px-3 py-2 flex items-center justify-between hover:text-white hover:bg-gray-700 rounded-lg", active_css: "bg-gray-900 hover:bg-gray-900 text-white rounded-lg")
    if sidebar_active?(action)
      css = "#{css} #{active_css}"
    end
    link_to(url, class: css) do
      yield
    end
  end

  def sidebar_active?(action)
    unless action.is_a?(Array)
      action = [action]
    end

    case action.length
    when 1
      return controller_name.to_s == action[0].to_s
    when 2
      return (controller_name.to_s == action[0].to_s &&
              action_name.to_s == action[1].to_s)
    else
      return false
    end
  end
end
