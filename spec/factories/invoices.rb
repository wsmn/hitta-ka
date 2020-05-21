FactoryBot.define do
  factory :invoice do
    customer
    invoice_date { rand(-10..10).days.from_now }
    due_date { invoice_date + 14.days }
    invoice_nbr

    trait(:with_pdf) do
      pdf { Rack::Test::UploadedFile.new(Rails.root.join("spec", "support", "file.pdf"), "attachment/pdf") }
    end
  end
end
