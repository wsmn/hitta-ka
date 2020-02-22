class ProjectsController < ApplicationController
  before_action(:require_login)

  def index
    @projects = current_user.projects.includes(:customer)
  end

  def new
    @project = Project.new
    @customers = current_user.customers
  end

  def create
    @project = Project.new(project_params)
    if current_user.customers.where(id: @project.customer_id).count == 1 && @project.save
      redirect_to(project_path(@project), notice: t('.success'))
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def show
    @project = current_user.projects.includes(:customer).find(params[:id])
  end

  def edit
    @project = current_user.projects.includes(:customer).find(params[:id])
    @customers = current_user.customers
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to(edit_project_path(@project), notice: t(".success"))
    else
      @customers = current_user.customers
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    project = current_user.projects.find(params[:id])
    project.destroy!
    redirect_to(projects_path, notice: t('.success'))
  end

  private

  def project_params
    params.require(:project).permit(:customer_id, :title)
  end
end
