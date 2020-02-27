class Customer < ApplicationRecord
  belongs_to(:organisation)
  has_many(:projects, dependent: :destroy)

  validates(:name, presence: true)
  store_accessor(:address, :street, :city, :state, :zip_code)
  store_accessor(:contact_information, :email, :phone, :web)

  def to_s
    "(##{id}) #{name}"
  end

  def initials
    Customer.initials(name)
  end

  def latest_project
    projects.order(created_at: :desc).first
  end
end
