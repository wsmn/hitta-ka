module Customers
  class ProjectsController < ApplicationController
    before_action(:require_login)

    def self.controller_path
      "projects"
    end

    def show
      @customer, _ = find_customer
      @project = @customer.projects.includes(:tasks, :invoices).find(params[:id])
    end

    def new
      @customer, @customers = find_customer
      @project = @customer.projects.build
    end

    def create
      @customer, @customers = find_customer
      @project = @customer.projects.build(project_params)
      if @project.save
        redirect_to(customer_project_path(@customer, @project), notice: t(".success"))
      else
        render(:new, status: :unprocessable_entity)
      end
    end

    def edit
      @customer, @customers = find_customer
      @project = @customer.projects.find(params[:id])
    end

    def update
      @customer, @customers = find_customer
      @project = @customer.projects.find(params[:id])
      if @project.update(project_params)
        redirect_to(edit_customer_project_path(@customer, @project), notice: t(".success"))
      else
        render(:edit, status: :unprocessable_entity)
      end
    end

    def destroy
      customer, _ = find_customer
      project = customer.projects.find(params[:id])
      project.destroy!
      redirect_to(customer_path(customer), notice: t(".success"))
    end

    private

    def find_customer
      [current_user.customers.find(params[:customer_id]), current_user.customers]
    end

    def project_params
      params.require(:project).permit(:title, :status)
    end
  end
end
