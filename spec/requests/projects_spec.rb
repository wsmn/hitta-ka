# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Projects", type: :request) do
  describe("GET /projects") do
    it("renders if empty") do
      user, _org = user_organisation
      sign_in_as(user)
      get(projects_path)
      expect(response).to have_http_status(200)
    end

    it("renders if not empty") do
      user, org = user_organisation
      sign_in_as(user)
      create_list(:customer, 5, organisation: org, projects: 3)
      get(projects_path)
      expect(response).to have_http_status(200)
      expect(Project.count).to eq(15)
    end
  end

  describe("GET /projects/new") do
    it("renders properly") do
      user, _org = user_organisation
      sign_in_as(user)
      get(new_project_path)
      expect(response).to have_http_status(200)
    end
  end

  describe("POST /projects") do
    it("creates new project") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      parameters = {
        customer_id: customer.id,
        title: "Villa Villekulla",
        status: :active
      }
      post(projects_path, params: {project: parameters})
      project = Project.last
      expect(response).to redirect_to(customer_project_path(customer, project))
      expect(project.customer).to eq(customer)
      expect(project.title).to eq("Villa Villekulla")
      expect(project.active?).to be(true)
    end

    it("fails if user not part of organisation") do
      user, _org = user_organisation
      sign_in_as(user)
      parameters = {
        customer_id: create(:customer).id,
        title: "Villa Villekulla",
        status: :active
      }
      post(projects_path, params: {project: parameters})
      expect(response).to have_http_status(422)
    end
  end
end
