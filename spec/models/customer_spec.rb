require "rails_helper"

RSpec.describe(Customer, type: :model) do
  it("gives proper initials with a name") do
    expect(Customer.new(name: "David Wessman").initials).to eq("DW")
  end

  it("removes AB from initials") do
    expect(Customer.new(name: "Kullabygdens Gräsklipparservice AB").initials).to eq("KG")
  end

  it("gives ? if no name present") do
    expect(Customer.new(name: "  ").initials).to eq("?")
  end
end
