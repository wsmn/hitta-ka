module Customers
  class InvoicesController < ApplicationController
    before_action(:require_login)

    def self.controller_path
      "invoices"
    end

    def show
      @customer, _ = find_customer
      @invoice = @customer.invoices.find(params[:id])
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

    private

    def find_customer
      [current_user.customers.find(params[:customer_id]), current_user.customers]
    end

    def invoice_params
      params.require(:invoice).permit(:invoice_date, :due_date, :invoice_nbr)
    end
  end
end
