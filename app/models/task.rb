class Task < ApplicationRecord
  belongs_to(:project, required: true)
  belongs_to(:invoice, required: false)
  enum(status: {upcoming: 0, done: 10, skipped: 20})
  validates(:title, presence: true)
  store_accessor(:settings, :custom_rate)

  def rate
    if custom_rate.nil? || custom_rate.empty?
      project.customer.task_rate
    else
      custom_rate.to_f
    end
  end

  def cost
    hours * rate
  end
end
