# frozen_string_literal: true

# View helper for projects
module ProjectHelper
  def project_statuses
    Project.statuses.keys.map { |k| [project_status(k), k] }
  end

  def project_status(key)
    t("models.project.status.#{key}")
  end

  def project_tag(status)
    status_class = "text-sm md:text-base inline-flex font-semibold rounded-full h-6 px-3 md:px-4 justify-center items-center"
    status_class += " #{project_status_class(status)}"
    content_tag(:span, project_status(status), class: status_class)
  end

  def project_status_class(status)
    case status
    when "pending"
      "bg-blue-400 text-white"
    when "active"
      "bg-green-400 text-gray-900"
    when "archived"
      "bg-gray-400"
    when "paused"
      "bg-yellow-400"
    end
  end
end
