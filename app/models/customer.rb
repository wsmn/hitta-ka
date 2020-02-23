class Customer < ApplicationRecord
  belongs_to(:organisation)
  has_many(:projects)

  validates(:name, presence: true)

  def to_s
    "(##{id}) #{name}"
  end

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

  def latest_project
    projects.order(created_at: :desc).first
  end
end
