class Task < ApplicationRecord
  belongs_to(:project, required: true)
  belongs_to(:invoice, required: false)
  enum(status: {upcoming: 0, active: 10, done: 20, skipped: 30})
  validates(:title, presence: true)
end
