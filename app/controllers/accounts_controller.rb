class AccountsController < ApplicationController
  before_action(:require_login)

  def show
    @customers = current_user.customers
    @projects = current_user.projects.includes(:customer).limit(5)
    @counts = {
      active: 8,
      archived: 5,
      total: current_user.projects.count,
    }
  end

  def settings
  end
end
