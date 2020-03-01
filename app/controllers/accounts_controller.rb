class AccountsController < ApplicationController
  before_action(:require_login)

  def show
    @customers = current_user.customers
    @projects = current_user.projects.includes(:customer).limit(5)
    @counts = {
      active: @projects.active.count,
      archived: @projects.archived.count,
      total: current_user.projects.count,
    }
  end

  def settings
  end
end
