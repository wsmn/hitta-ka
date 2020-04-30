class AccountsController < ApplicationController
  before_action(:require_login)

  def show
    @customers = current_user.customers
    @projects = current_user.projects.includes(:customer).limit(5)
    @invoices = current_user.invoices.includes(:customer).limit(5)
    @tasks = current_user.tasks.limit(5)
    @counts = {
      active: current_user.projects.active.count,
      archived: current_user.projects.archived.count,
      total: current_user.projects.count,
    }
    @project_count_week = Project.where("created_at >= ?", Date.today.at_beginning_of_week).count
    @project_count_month = Project.where("created_at >= ?", Date.today.at_beginning_of_month).count
    @project_count_year = Project.where("created_at >= ?", Date.today.at_beginning_of_year).count
    @project_count_total = Project.count
    @task_count_week = Task.where("created_at >= ?", Date.today.at_beginning_of_month).count
    @task_count_month = Task.where("created_at >= ?", Date.today.at_beginning_of_month).count
    @task_count_year = Task.where("created_at >= ?", Date.today.at_beginning_of_year).count
    @task_count_total = Task.count
    @invoice_count_week = Invoice.where("created_at >= ?", Date.today.at_beginning_of_month).count
    @invoice_count_month = Invoice.where("created_at >= ?", Date.today.at_beginning_of_month).count
    @invoice_count_year = Invoice.where("created_at >= ?", Date.today.at_beginning_of_year).count
    @invoice_count_total = Invoice.count
    @project_count_last_week = Project.where("created_at >= ?", Date.today.at_beginning_of_week-7.days).count
    @project_count_last_month = Project.where("created_at >= ?", Date.today.at_beginning_of_month-30.days).count
    @project_count_last_year = Project.where("created_at >= ?", Date.today.at_beginning_of_year-365.days).count
    @task_count_last_week = Task.where("created_at >= ?", Date.today.at_beginning_of_week-7.days).count
    @task_count_last_month = Task.where("created_at >= ?", Date.today.at_beginning_of_month-30.days).count
    @task_count_last_year = Task.where("created_at >= ?", Date.today.at_beginning_of_year-365.days).count
    @invoice_count_last_week = Invoice.where("created_at >= ?", Date.today.at_beginning_of_week-7.days).count
    @invoice_count_last_month = Invoice.where("created_at >= ?", Date.today.at_beginning_of_month-30.days).count
    @invoice_count_last_year = Invoice.where("created_at >= ?", Date.today.at_beginning_of_year-365.days).count
  end

  def update
    new_password = password_params.fetch(:new_password, nil)
    if new_password.present?
      update_password
    else
      update_user
    end
  end

  def settings
    @organisation = current_user.organisations.first
  end

  private

  def check_user
    current_user == User.authenticate(current_user.email, password_params.fetch(:current_password, nil))
  end

  def update_user
    if current_user.update(user_params)
      redirect_to(settings_account_path, notice: t(".user_updated"))
    else
      render(:settings, status: :unprocessable_entity)
    end
  end

  def update_password
    if check_user
      if current_user.update(password: password_params.fetch(:new_password, nil))
        redirect_to(settings_account_path, notice: t(".password_updated"))
      else
        current_user.errors.add(:new_password, t(".invalid_password"))
        render(:settings, status: :unprocessable_entity)
      end
    else
      current_user.errors.add(:current_password, t(".wrong_current_password"))
      render(:settings, status: :unprocessable_entity)
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def password_params
    params.require(:user).permit(:current_password, :new_password)
  end
end
