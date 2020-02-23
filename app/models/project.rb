class Project < ApplicationRecord
  SYMBOLS = ["fa-home", "fa-industry", "fa-building"]
  KINDS = ["Villa", "Lägenhet", "Fabrik", "Attefall"]

  belongs_to(:customer)
  validates(:title, presence: true)

  def symbol
    SYMBOLS[id % SYMBOLS.length]
  end

  def kind
    KINDS[id % KINDS.length]
  end

  def to_s
    title
  end
end
