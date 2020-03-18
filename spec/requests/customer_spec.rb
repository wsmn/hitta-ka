# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Customer", type: :request) do
  describe("GET /customers/:id") do
    it("renders show") do
      user, org = user_organisation
      customer = create(:customer, organisation: org)

      sign_in_as(user)
      get(customer_path(customer))
      expect(response).to have_http_status(200)
    end

    it("fails if user is not in organisation") do
      # Customer with new organisation
      customer = create(:customer)

      # Sign is as new user, no organisations
      sign_in
      expect {
        get(customer_path(customer))
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
