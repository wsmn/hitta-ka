require "rails_helper"

RSpec.describe "Organisations", type: :request do
  describe("GET /account/organisation") do
    it("renders if empty") do
      user, _org = user_organisation
      sign_in_as(user)
      get(account_organisation_path)
      expect(response).to have_http_status(200)
    end
  end
end
