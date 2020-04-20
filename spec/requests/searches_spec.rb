# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Searches", type: :request) do
  describe("GET root, search for company") do
    it("renders root page, then do search request") do
      sign_in
      get(root_path)
      post(company_search_url, params: {search: {text: "David!"}})
      expect(response).to redirect_to(map_url(search: "David!"))
    end
  end

  describe("GET /customers") do
    it("searches for customer") do
      user, org = user_organisation
      sign_in_as(user)
      create_list(:customer, 5, organisation: org)
      get(customers_url)
      expect(response).to have_http_status(200)
      post(customer_search_url, xhr: true, params: {search: "Arthur"})
      expect(response).to have_http_status(200)
    end
  end
end
