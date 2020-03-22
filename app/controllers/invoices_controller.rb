class InvoicesController < ApplicationController
  include Pagy::Backend
  before_action(:require_login)

  def index
    invoices = current_user.invoices
    if params[:status]
      invoices = invoices.where(status: params[:status])
    end
    @pagy, @invoices = pagy(invoices)
  end

  def new
    @customers = current_user.customers
    @invoice = Invoice.new(invoice_date: Date.today)
  end

  def create
    @customers = current_user.customers
    @invoice = Invoice.new(invoice_params)
    if @customers.where(id: @invoice.customer_id).count == 1 && @invoice.save
      redirect_to(customer_invoice_path(@invoice.customer, @invoice), notice: t(".success"))
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:customer_id, :invoice_date, :due_date, :invoice_nbr, :status)
  end
end
