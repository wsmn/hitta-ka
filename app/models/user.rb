# frozen_string_literal: true

# Website users
class User < ApplicationRecord
  has_many(:organisation_users)
  has_many(:organisations, through: :organisation_users)
  has_many(:customers, through: :organisations)
  has_many(:projects, through: :customers)

  include Clearance::User
  enum(role: {user: 0, admin: 1})
end
