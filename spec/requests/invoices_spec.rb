# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Invoices", type: :request) do
  describe("GET /invoices") do
    it("renders properly") do
      user, org = user_organisation
      create_list(:invoice, 10) do |invoice|
        invoice.customer = create(:customer, organisation: org)
      end
      sign_in_as(user)
      get(invoices_url)
      expect(response).to have_http_status(200)
    end
  end

  describe("GET /invoices/new") do
    it("renders properly") do
      user, _ = user_organisation
      sign_in_as(user)
      get(new_invoice_url)
      expect(response).to have_http_status(200)
    end
  end

  describe("POST /invoices") do
    it("creates new invoice") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      parameters = {
        customer_id: customer.id,
        invoice_date: 1.day.from_now.to_date
      }
      expect {
        post(invoices_url, params: {invoice: parameters})
      }.to change { Invoice.count }.by(1)

      invoice = Invoice.last

      expect(response).to redirect_to(customer_invoice_url(customer, invoice))
      expect(invoice.customer).to eq(customer)
      expect(invoice.invoice_date).to eq(1.day.from_now.to_date)
    end

    it("fails if user not part of customer organisation") do
      user, _org = user_organisation
      sign_in_as(user)
      # Customer with new organisation
      customer = create(:customer)
      parameters = {
        customer_id: customer.id,
        invoice_date: 1.day.from_now.to_date
      }

      expect {
        post(invoices_url, params: {invoice: parameters})
      }.to change { Invoice.count }.by(0)

      expect(response).to have_http_status(422)
    end
  end
end
