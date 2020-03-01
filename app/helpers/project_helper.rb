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
    status_class = "text-sm md:text-base inline-flex font-semibold rounded-full h-6 px-3 md:px-4 justify-center items-center"
    status_class += " #{project_status_class(status)}"
    content_tag(:span, project_status(status), class: status_class)
  end

  def project_status_class(status)
    case status
    when "upcoming"
      "bg-blue-400 text-white"
    when "active"
      "bg-green-400 text-gray-900"
    when "completed"
      "bg-green-800 text-white"
    when "archived"
      "bg-gray-400 text-white"
    when "paused"
      "bg-yellow-400"
    when "cancelled"
      "bg-red-400 text-white"
    end
  end

  def project_status_button(status, current, object: :projects)
    current ||= :all
    object ||= :projects
    css = "border py-2 px-3 rounded mr-2"
    css = if status == current.to_sym
      "#{css} bg-blue-600 border-blue-600 hover:bg-blue-500 hover:border-blue-500 text-white"
    else
      "#{css} bg-gray-600 border-gray-600 hover:bg-gray-500 hover:border-gray-500 text-gray"
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
