# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Customers::Invoices", type: :request) do
  describe("GET /customers/:customer_id/invoices/new") do
    it("renders properly") do
      user, org = user_organisation
      customer = create(:customer, organisation: org)
      sign_in_as(user)
      get(new_customer_invoice_url(customer))
      expect(response).to have_http_status(200)
    end
  end

  describe("POST /customer/:id/invoices") do
    it("creates new invoice for current customer") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      parameters = {
        invoice_date: 1.day.from_now.to_date
      }
      expect {
        post(customer_invoices_url(customer), params: {invoice: parameters})
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
        invoice_date: 1.day.from_now.to_date
      }

      expect {
        post(customer_invoices_url(customer), params: {invoice: parameters})
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe("GET /customers/:customer_id/invoices/:id") do
    it("renders properly") do
      user, org = user_organisation
      customer = create(:customer, organisation: org)
      invoice = create(:invoice, customer: customer)

      sign_in_as(user)
      get(customer_invoice_url(customer, invoice))
      expect(response).to have_http_status(200)
    end

    it("fails if user is not in organisation") do
      # Customer with new organisation
      invoice = create(:invoice)

      # Sign is as new user, no organisations
      sign_in
      expect {
        get(customer_invoice_url(invoice.customer, invoice))
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe("PATCH /customers/:customer_id/invoices/:id") do
    it("updates due_date") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      invoice = create(:invoice, customer: customer)
      due_date = 1000.days.from_now.to_date
      parameters = {
        due_date: due_date,
        customer_id: 55
      }
      expect(invoice.due_date).not_to eq(due_date)

      patch(customer_invoice_url(customer, invoice), params: {invoice: parameters})
      expect(response).to redirect_to(customer_invoice_url(customer, invoice))
      invoice.reload
      expect(invoice.due_date).to eq(due_date)
      expect(invoice.customer).to eq(customer)
    end

    it("fails if user not part of organisation") do
      sign_in
      invoice = create(:invoice)
      due_date = 1000.days.from_now.to_date
      parameters = {
        due_date: due_date
      }
      expect(invoice.due_date).not_to eq("Kund Kundsson")

      expect {
        patch(customer_invoice_url(invoice.customer, invoice), params: {invoice: parameters})
      }.to raise_error(ActiveRecord::RecordNotFound)

      invoice.reload
      expect(invoice.due_date).to_not eq(due_date)
    end
  end

  describe("DELETE /customers/:customer_id/invoices/:id") do
    it("deletes invoice") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      invoice = create(:invoice, customer: customer)

      expect {
        delete(customer_invoice_url(customer, invoice))
      }.to change { Invoice.count }.by(-1)
      expect(response).to redirect_to(customer_url(customer))
    end

    it("fails if user not part of organisation") do
      sign_in
      # Customer with new org
      customer = create(:customer)
      invoice = create(:invoice, customer: customer)

      expect {
        delete(customer_invoice_url(customer, invoice))
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
