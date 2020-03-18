class Invoice < ApplicationRecord
  belongs_to(:customer, required: true)
  has_many(:tasks)

  enum(status: {unpayed: 0, payed: 10})

  def hours
    tasks.select("SUM(hours) as hours").to_a.first.try(:hours) || 0
  end
end
