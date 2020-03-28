module Invoices
  class TasksController < ApplicationController
    before_action(:require_login)

    def update
      @task = current_user.tasks.where(invoice: nil).find(params[:id])
      @invoice = current_user.invoices.includes(:tasks).find(params[:invoice_id])
      if @task.update(invoice: @invoice)
        @invoice.reload
        @new_tasks = @invoice.customer.tasks.includes(:project).where(invoice: nil).group_by(&:project)
      else
        @new_tasks = {}
      end
    end

    def destroy
      @invoice = current_user.invoices.includes(:tasks).find(params[:invoice_id])
      @task = @invoice.tasks.find(params[:id])
      if @task.update(invoice: nil)
        @invoice.reload
        @new_tasks = @invoice.customer.tasks.includes(:project).where(invoice: nil).group_by(&:project)
      else
        @new_tasks = {}
      end
    end
  end
end
