# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Presentation", type: :request) do
  describe("GET /") do
    it("renders index page") do
      get(root_path)
      expect(response).to have_http_status(200)
    end
  end

  describe("GET /account") do
    it("requires sign in") do
      get(account_path)
      expect(response).to redirect_to(sign_in_path)

      sign_in
      get(account_path)
      expect(response).to have_http_status(200)
    end
  end
end
