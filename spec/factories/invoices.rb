FactoryBot.define do
  factory :invoice do
    project
    invoice_date { rand(-10..10).days.from_now }
    due_date { invoice_data + 14.days }
    invoice_nbr
  end
end
