# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Searches", type: :request) do
  describe("GET /project") do
    it("renders root page, then do search request") do
      sign_in
      get(root_path)
      post(company_search_url, params: {search: {text: "David!"}})
      expect(response).to redirect_to(map_url(search: "David!"))
    end
  end
end
