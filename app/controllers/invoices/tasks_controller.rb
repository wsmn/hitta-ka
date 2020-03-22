module Invoices
  class TasksController < ApplicationController
    before_action(:require_login)

    def update
      @task = current_user.tasks.where(invoice: nil).find(params[:id])
      @invoice = current_user.invoices.includes(:tasks).find(params[:invoice_id])
      @new_tasks = @invoice.customer.tasks.where(invoice: nil).group_by(&:project)
      @status = @task.update(invoice: @invoice)
    end

    def destroy
      @invoice = current_user.invoices.includes(:tasks).find(params[:invoice_id])
      @task = @invoice.tasks.find(params[:id])
      @new_tasks = @invoice.customer.tasks.where(invoice: nil).group_by(&:project)
      @status = @task.update(invoice: nil)
    end
  end
end
