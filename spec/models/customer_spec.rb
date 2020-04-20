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

  it("gets custom task rate as float") do
    expect(Customer.new(custom_task_rate: "995.0").task_rate).to eq(995.0)
  end

  it("gets organisation task rate as float") do
    organisation = Organisation.new
    allow(organisation).to receive(:task_rate) { 500.0 }
    customer = Customer.new(organisation: organisation, custom_task_rate: nil)
    expect(customer.task_rate).to eq(500.0)
  end
end
