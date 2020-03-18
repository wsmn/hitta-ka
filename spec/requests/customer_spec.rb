# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Customer", type: :request) do
  describe("GET /customers") do
    it("renders if empty") do
      user, _org = user_organisation
      sign_in_as(user)
      get(customers_path)
      expect(response).to have_http_status(200)
    end

    it("renders if not empty") do
      user, org = user_organisation
      sign_in_as(user)
      create_list(:customer, 10, organisation: org)
      get(customers_path)
      expect(response).to have_http_status(200)
    end
  end

  describe("GET /customers/new") do
    it("renders properly") do
      user, _org = user_organisation
      sign_in_as(user)
      get(new_customer_path)
      expect(response).to have_http_status(200)
    end
  end

  describe("POST /customers") do
    it("creates new customer") do
      user, org = user_organisation
      sign_in_as(user)
      parameters = {
        organisation_id: org.id,
        name: "Kund Kundsson",
        street: "Gåsvägen 74",
        city: "Gåstorp",
        zip_code: "70055",
        state: "Gåse",
        email: "kund@kundsson.gås",
        phone: "070055000",
      }
      post(customers_path, params: {customer: parameters})
      customer = Customer.last
      expect(response).to redirect_to(customer_path(customer))
      expect(customer.name).to eq("Kund Kundsson")
      expect(customer.street).to eq("Gåsvägen 74")
    end

    it("fails if user not part of organisation") do
      user, _org = user_organisation
      sign_in_as(user)
      parameters = {
        organisation_id: create(:organisation).id,
        name: "Kund Kundsson",
        street: "Gåsvägen 74",
        city: "Gåstorp",
        zip_code: "70055",
        state: "Gåse",
        email: "kund@kundsson.gås",
        phone: "070055000",
      }
      post(customers_path, params: {customer: parameters})
      expect(response).to have_http_status(422)
    end
  end

  describe("GET /customers/:id") do
    it("renders properly") do
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

  describe("GET /customers/:id/edit") do
    it("renders properly") do
      user, org = user_organisation
      customer = create(:customer, organisation: org)

      sign_in_as(user)
      get(edit_customer_path(customer))
      expect(response).to have_http_status(200)
    end

    it("fails if user is not in organisation") do
      # Customer with new organisation
      customer = create(:customer)

      # Sign is as new user, no organisations
      sign_in
      expect {
        get(edit_customer_path(customer))
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe("PATCH /customers/:id") do
    it("updates name") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      parameters = {
        name: "Kund Kundsson",
        organisation_id: 55,
      }
      expect(customer.name).not_to eq("Kund Kundsson")

      patch(customer_path(customer), params: {customer: parameters})
      expect(response).to redirect_to(edit_customer_path(customer))
      customer.reload
      expect(customer.name).to eq("Kund Kundsson")
      expect(customer.organisation).to eq(org)
    end

    it("fails if user not part of organisation") do
      user, _org = user_organisation
      sign_in_as(user)
      # Customer with new org
      customer = create(:customer)
      parameters = {
        name: "Kund Kundsson",
      }
      expect(customer.name).not_to eq("Kund Kundsson")

      expect {
        patch(customer_path(customer), params: {customer: parameters})
      }.to raise_error(ActiveRecord::RecordNotFound)

      customer.reload
      expect(customer.name).to_not eq("Kund Kundsson")
    end
  end

  describe("DELETE /customers/:id") do
    it("deletes customer") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)

      expect {
        delete(customer_path(customer))
      }.to change { Customer.count }.by(-1)
      expect(response).to redirect_to(customers_path)
    end

    it("fails if user not part of organisation") do
      user, _org = user_organisation
      sign_in_as(user)
      # Customer with new org
      customer = create(:customer)

      expect {
        delete(customer_path(customer))
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
