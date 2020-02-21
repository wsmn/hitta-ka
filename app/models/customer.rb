class Customer < ApplicationRecord
  belongs_to(:organisation)

  validates(:name, presence: true)
end
