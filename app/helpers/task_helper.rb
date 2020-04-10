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
    status_class = "inline-flex items-center px-3 py-0.5 rounded text-xs md:text-sm font-medium leading-4"
    status_class += " #{task_status_class(status)}"
    content_tag(:span, task_status(status), class: status_class)
  end

  def task_status_class(status)
    case status
    when "upcoming"
      "bg-blue-400 text-white"
    when "done"
      "bg-green-400 text-white"
    when "skipped"
      "bg-yellow-400 text-white"
    end
  end
end
