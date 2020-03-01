class Project < ApplicationRecord
  SYMBOLS = ["fa-home", "fa-industry", "fa-building"]
  KINDS = ["Villa", "Lägenhet", "Fabrik", "Attefall"]

  belongs_to(:customer)
  has_many(:tasks, dependent: :destroy)
  validates(:title, presence: true)
  enum(status: {upcoming: 0, active: 10, paused: 20, completed: 30, cancelled: 40, archived: 50})

  def symbol
    SYMBOLS[id % SYMBOLS.length]
  end

  def kind
    KINDS[id % KINDS.length]
  end

  def to_s
    title
  end

  def hours
    tasks.select("SUM(hours) as hours").to_a.first.try(:hours) || 0
  end
end
