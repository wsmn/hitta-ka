require "rails_helper"

RSpec.describe(Invoice, type: :model) do
  include ActiveSupport::Testing::TimeHelpers
  it("gives proper filename") do
    travel_to(Time.parse("2019-01-19")) do
      expect(Invoice.new.filename).to eq("invoice-2019-01-19.pdf")
    end
  end
end
