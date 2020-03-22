# frozen_string_literal: true

# View helper for tasks
module TaskHelper
  def task_statuses
    Task.statuses.keys.map { |k| [task_status(k), k] }
  end

  def task_status(key)
    t("model.task.status.#{key}")
  end

  def task_tag(status)
    status_class = "text-sm md:text-base inline-flex font-semibold rounded-full h-6 px-3 md:px-4 justify-center items-center"
    status_class += " #{task_status_class(status)}"
    content_tag(:span, task_status(status), class: status_class)
  end

  def task_status_class(status)
    case status
    when "upcoming"
      "bg-blue-400 text-white"
    when "done"
      "bg-green-400 text-gray-900"
    when "skipped"
      "bg-yellow-400 text-white"
    end
  end
end
