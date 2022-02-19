require "rails_helper"

RSpec.describe "Sign in", type: :system do
  before do
    driven_by(:selenium)
    user = create(:organisation_user).user
    sign_in_as(user)
  end

  it("failure") do
    visit(sign_in_path)
    expect(page).to have_content("Hello world")
  end

  it("success") do
    visit(sign_in_path)
    expect(page).to have_content("Logga in på ditt konto")
  end

  it("skipped", skip: true) do
    visit(sign_in_path)
    expect(page).to have_content("Skipped")
  end

  it("error") do
    visit(sign_in_path)
    invalid_code
  end
end
