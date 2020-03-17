class Customer < ApplicationRecord
  belongs_to(:organisation)
  has_many(:projects, dependent: :destroy)
  has_many(:tasks, through: :projects)

  validates(:name, presence: true)
  store_accessor(:address, :street, :city, :state, :zip_code)
  store_accessor(:contact_information, :email, :phone)

  def to_s
    "(##{id}) #{name}"
  end

  def initials
    Customer.initials(name)
  end

  def latest_project
    projects.order(created_at: :desc).first
  end

  def hours
    tasks.select("SUM(hours) as hours").to_a.first.try(:hours) || 0
  end
end
