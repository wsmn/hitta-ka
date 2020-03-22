class AccountsController < ApplicationController
  before_action(:require_login)

  def show
    @customers = current_user.customers
    @projects = current_user.projects.includes(:customer).limit(5)
    @invoices = current_user.invoices.includes(:customer).limit(5)
    @counts = {
      active: current_user.projects.active.count,
      archived: current_user.projects.archived.count,
      total: current_user.projects.count,
    }
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
