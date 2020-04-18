class Customer < ApplicationRecord
  belongs_to(:organisation)
  has_many(:projects, dependent: :destroy)
  has_many(:tasks, through: :projects)
  has_many(:invoices, dependent: :destroy)

  validates(:name, presence: true)
  store_accessor(:address, :street, :city, :state, :zip_code)
  store_accessor(:contact_information, :email, :phone)

  def self.searchable_columns
    %i[name address contact_information]
  end

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

  def invoiced_tasks
    tasks.where.not(invoice: nil)
  end

  def invoiced_total
    total = 0
    invoiced_tasks.each { |task| total += task.cost }
    total
  end

  def invoiced_paid
    total = 0
    tasks.includes(:invoice).where(invoices: {status: :paid}).each { |task| total += task.cost }
    total
  end

  def invoiced_unpaid
    total = 0
    tasks.includes(:invoice).where(invoices: {status: :unpaid}).each { |task| total += task.cost }
    total
  end
end
