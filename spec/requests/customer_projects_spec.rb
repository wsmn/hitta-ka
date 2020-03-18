# frozen_string_literal: true

require "rails_helper"
RSpec.describe("Customer projects", type: :request) do
  describe("GET /customers/:id/projects/new") do
    it("renders properly") do
      user, org = user_organisation
      customer = create(:customer, organisation: org)
      sign_in_as(user)
      get(new_customer_project_path(customer))
      expect(response).to have_http_status(200)
    end
  end

  describe("POST /customer/:id/projects") do
    it("creates new project for current customer") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org)
      parameters = {
        title: "Villa Villekulla",
        status: :active,
      }
      post(customer_projects_path(customer), params: {project: parameters})
      project = Project.last
      expect(response).to redirect_to(customer_project_path(customer, project))
      expect(project.customer).to eq(customer)
      expect(project.active?).to be(true)
    end

    it("fails if user not part of customer organisation") do
      user, _org = user_organisation
      sign_in_as(user)
      # Customer with new organisation
      customer = create(:customer)
      parameters = {
        title: "Villa Villekulla",
        status: :upcoming,
      }

      expect {
        post(customer_projects_path(customer), params: {project: parameters})
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe("GET /customers/:customer_id/projects/:id") do
    it("renders properly") do
      user, org = user_organisation
      customer = create(:customer, organisation: org, projects: 1)
      project = customer.projects.first

      sign_in_as(user)
      get(customer_project_path(customer, project))
      expect(response).to have_http_status(200)
    end

    it("fails if user is not in organisation") do
      # Sign in user without organisations
      sign_in

      # Create customer in new organisation
      customer = create(:customer, projects: 1)
      project = customer.projects.first

      expect {
        get(customer_project_path(customer, project))
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe("GET /customers/:id/edit") do
    it("renders properly") do
      user, org = user_organisation
      customer = create(:customer, organisation: org, projects: 1)
      project = customer.projects.first

      sign_in_as(user)
      get(edit_customer_project_path(customer, project))
      expect(response).to have_http_status(200)
    end

    it("fails if user is not in organisation") do
      # Sign in user without organisation
      sign_in

      # Customer with new organisation
      customer = create(:customer, projects: 1)
      project = customer.projects.first

      # Sign is as new user, no organisations
      expect {
        get(edit_customer_project_path(customer, project))
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe("PATCH /customers/:customer_id/projects/:id") do
    it("updates title and status") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org, projects: 1)
      project = customer.projects.first
      project.active!
      parameters = {
        title: "Villa Villekulla",
        status: :upcoming,
        customer_id: 55, # this parameter is ignored
      }
      expect(project.title).not_to eq("Villa Villekulla")

      patch(customer_project_path(customer, project), params: {project: parameters})
      expect(response).to redirect_to(edit_customer_project_path(customer, project))
      project.reload
      expect(project.title).to eq("Villa Villekulla")
      expect(project.upcoming?).to be(true)
      expect(project.customer).to eq(customer)
    end

    it("fails if user is not part of organisation") do
      sign_in
      customer = create(:customer, projects: 1)
      project = customer.projects.first

      parameters = {
        title: "Villa Villekulla",
      }
      expect(project.title).not_to eq("Villa Villekulla")

      expect {
        patch(customer_project_path(customer, project), params: {project: parameters})
      }.to raise_error(ActiveRecord::RecordNotFound)
      project.reload
      expect(project.title).not_to eq("Villa Villekulla")
      expect(project.customer).to eq(customer)
    end
  end

  describe("DELETE /customers/:customer_id/projects/:id") do
    it("deletes project") do
      user, org = user_organisation
      sign_in_as(user)
      customer = create(:customer, organisation: org, projects: 1)
      project = customer.projects.first

      expect {
        delete(customer_project_path(customer, project))
      }.to change { Project.count }.by(-1)
      expect(response).to redirect_to(customer_path(customer))
    end

    it("fails if user not part of organisation") do
      sign_in

      # Customer with new org
      customer = create(:customer, projects: 1)
      project = customer.projects.first

      expect {
        delete(customer_project_path(customer, project))
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
