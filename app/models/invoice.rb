class Invoice < ApplicationRecord
  belongs_to(:customer, required: true)
  has_many(:tasks)
  has_many(:projects, through: :tasks)

  enum(status: {unpaid: 0, paid: 10})

  def hours
    tasks.select("SUM(hours) as hours").to_a.first.try(:hours) || 0
  end

  def amount
    hours * 999
  end

  def past_due?
    if due_date.nil?
      false
    else
      due_date < Date.today
    end
  end
end
