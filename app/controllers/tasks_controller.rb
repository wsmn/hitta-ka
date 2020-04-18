class TasksController < ApplicationController
  def show
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    respond_to do |format|
      format.html do
        if @task.save
          redirect_to(customer_project_path(@project.customer, @project), notice: t(".success"))
        else
          render(:new, status: :unprocessable_entity)
        end
      end
      format.js do
        if @task.save
          redirect_to(customer_project_path(@project.customer, @project), notice: t(".success"))
        end
      end
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to(customer_project_path(@project.customer, @project), notice: t(".success"))
    else
      render(:show, status: :unprocessable_entity)
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    task = project.tasks.find(params[:id])
    task.destroy!
    redirect_to(customer_project_path(project.customer, project), notice: t(".success"))
  end

  private

  def task_params
    params.require(:task).permit(:title, :status, :description, :hours)
  end
end
