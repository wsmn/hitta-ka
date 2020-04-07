# frozen_string_literal: true

# View helper for projects
module ProjectHelper
  def project_statuses
    Project.statuses.keys.map { |k| [project_status(k), k] }
  end

  def project_status(key)
    t("model.project.status.#{key}")
  end

  def project_tag(status)
    status_class = "inline-flex items-center px-3 py-0.5 rounded text-sm font-medium leading-4 border"
    status_class += " #{project_status_class(status)}"
    content_tag(:span, project_status(status), class: status_class)
  end

  def project_status_class(status)
    case status
    when "upcoming"
      "bg-blue-100 text-blue-800 border-blue-800"
    when "active"
      "bg-green-100 text-green-800 border-green-800"
    when "completed"
      "bg-green-800 text-white"
    when "archived"
      "bg-gray-100 text-gray-800 border-gray-800"
    when "paused"
      "bg-yellow-400"
    when "cancelled"
      "bg-red-400 text-white"
    end
  end

  def project_status_mobile(key)
  end

  def project_tag_mobile(status)
    status_class = "rounded-full h-3 w-3"
    status_class += " #{project_status_mobile_class(status)}"
    content_tag(:span, project_status_mobile(status), class: status_class)
  end

  def project_status_mobile_class(status)
    case status
    when "upcoming"
      "bg-blue-500"
    when "active"
      "bg-green-500"
    when "completed"
      "bg-green-800"
    when "archived"
      "bg-gray-500"
    when "paused"
      "bg-yellow-400"
    when "cancelled"
      "bg-red-400"
    end
  end

  def project_status_button(status, current, object: :projects)
    current ||= :all
    object ||= :projects
    css = "w-20 h-16 px-3 mr-2 -mb-px flex justify-center items-center"
    css = if status == current.to_sym
      "#{css} border-b-2 border-blue-600 text-blue-600 font-medium"
    else
      "#{css} text-gray-800 hover:text-blue-500"
    end
    if status == :all
      path = polymorphic_path(object)
      text = t("model.project.status.all")
    else
      path = polymorphic_path(object, status: status)
      text = project_status(status)
    end

    link_to(text, path, class: css)
  end
end
