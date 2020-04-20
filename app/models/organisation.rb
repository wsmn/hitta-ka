class Organisation < ApplicationRecord
  has_many(:customers)
  has_many(:organisation_users)
  has_many(:users, through: :organisation_users)

  def to_s
    title
  end

  def task_rate
    999
  end
end
