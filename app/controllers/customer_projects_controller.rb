class CustomerProjectsController < ApplicationController
  before_action(:require_login)

  def self.controller_path
    "projects"
  end

  def show
    @customer = current_user.customers.find(params[:customer_id])
    @project = @customer.projects.find(params[:id])
  end

  def new
    @customers = current_user.customers
    @customer = @customers.find(params[:customer_id])
    @project = @customer.projects.build
  end

  def create
    @customers = current_user.customers
    @customer = @customers.find(params[:customer_id])
    @project = @customer.projects.build(project_params)
    if @project.save
      redirect_to(customer_project_path(@customer, @project), notice: t(".success"))
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @customers = current_user.customers
    @customer = @customers.find(params[:customer_id])
    @project = @customer.projects.find(params[:id])
  end

  def update
    @customers = current_user.customers
    @customer = @customers.find(params[:customer_id])
    @project = @customer.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to(edit_customer_project_path(@customer, @project), notice: t(".success"))
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    customer = current_user.customers.find(params[:customer_id])
    project = customer.projects.find(params[:id])
    project.destroy!
    redirect_to(customer_path(customer), notice: t(".success"))
  end

  private

  def project_params
    params.require(:project).permit(:title, :status)
  end
end
