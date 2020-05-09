class Organisation < ApplicationRecord
  has_many(:customers)
  has_many(:organisation_users)
  has_many(:users, through: :organisation_users)
  has_one_attached(:logo)
  store_accessor(:address, :street, :city, :state, :zip_code, :country)
  store_accessor(:settings, :vat, :language, :currency, :currency_format, :date_format, :time_format, :time_zone, :first_day_of_week, :first_month_of_year)

  def to_s
    title
  end

  def task_rate
    999
  end
end
