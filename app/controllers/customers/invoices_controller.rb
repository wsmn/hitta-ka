module Customers
  class InvoicesController < ApplicationController
    before_action(:require_login)

    def self.controller_path
      "invoices"
    end

    def show
      @customer, @customers = find_customer
      @invoice = @customer.invoices.includes(:tasks).find(params[:id])
      @new_tasks = @customer.tasks.where(invoice: nil).group_by(&:project)
      @task = @customer.tasks.build
    end

    def new
      @customer, @customers = find_customer
      @invoice = @customer.invoices.build(invoice_date: Date.today)
    end

    def create
      @customer, @customers = find_customer
      @invoice = @customer.invoices.build(invoice_params)
      if @invoice.save
        redirect_to(customer_invoice_path(@customer, @invoice), notice: t(".success"))
      end
    end

    def edit
      @customer, @customers = find_customer
      @invoice = @customer.invoices.find(params[:id])
    end

    def update
      @customer, @customers = find_customer
      @invoice = @customer.invoices.find(params[:id])
      if @invoice.update(invoice_params)
        redirect_to(customer_invoice_path(@customer, @invoice), notice: t(".success"))
      else
        render(:show, status: :unprocessable_entity)
      end
    end

    def destroy
      customer, _ = find_customer
      invoice = customer.invoices.find(params[:id])
      invoice.destroy!
      redirect_to(customer_path(customer), notice: t(".success"))
    end

    private

    def find_customer
      [current_user.customers.find(params[:customer_id]), current_user.customers]
    end

    def invoice_params
      params.require(:invoice).permit(:invoice_date, :due_date, :invoice_nbr)
    end
  end
end
