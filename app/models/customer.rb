class Customer < ApplicationRecord
  belongs_to(:organisation)

  validates(:name, presence: true)

  def initials
    initials = ""
    if name
      initials = (name.split - ["AB"]).map(&:first).join.strip
    end
    if initials == ""
      initials = "?"
    end
    initials
  end
end
