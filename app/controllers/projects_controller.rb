class ProjectsController < ApplicationController
  include Pagy::Backend
  before_action(:require_login)

  def index
    @projects = current_user.projects.includes(:customer)
    if params[:status]
      @projects = @projects.where(status: params[:status])
    end

    @pagy, @projects = pagy(@projects)
  end

  def new
    @customers = current_user.customers
    @project = Project.new
  end

  def create
    @customers = current_user.customers
    @project = Project.new(project_params)
    if @customers.where(id: @project.customer_id).count == 1 && @project.save
      redirect_to(customer_project_path(@project.customer, @project), notice: t(".success"))
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :customer_id, :status)
  end
end
