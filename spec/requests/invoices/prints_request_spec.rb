require "rails_helper"

RSpec.describe("Invoices::Prints", type: :request) do
  describe("POST /invoice/:invoice_id/prints") do
    it("creates new print") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      invoice = create(:invoice, customer: customer)

      expect(invoice.pdf.attached?).to be(false)
      post(invoice_prints_url(invoice))

      expect(response).to redirect_to(invoice_prints_url(invoice))
      invoice.reload
      expect(invoice.pdf.attached?).to be(true)
    end

    it("creates new print - as json") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      invoice = create(:invoice, customer: customer)

      expect(invoice.pdf.attached?).to be(false)
      post(invoice_prints_url(invoice), as: :json)

      expect(response).to have_http_status(:created)
      invoice.reload
      expect(invoice.pdf.attached?).to be(true)
    end
  end

  describe("GET /invoice/:invoice_id/prints") do
    it("sends pdf if already attached") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      invoice = create(:invoice, :with_pdf, customer: customer)

      get(invoice_prints_url(invoice))
      expect(response).to have_http_status(200)
    end

    it("redirects with alert if no attached pdf") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      invoice = create(:invoice, customer: customer)

      get(invoice_prints_url(invoice))
      expect(response).to redirect_to(customer_invoice_path(customer, invoice))
    end
  end
end
