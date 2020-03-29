class Task < ApplicationRecord
  belongs_to(:project, required: true)
  belongs_to(:invoice, required: false)
  enum(status: {upcoming: 0, done: 10, skipped: 20})
  validates(:title, presence: true)

  def rate
    999
  end

  def cost
    hours * rate
  end
end
