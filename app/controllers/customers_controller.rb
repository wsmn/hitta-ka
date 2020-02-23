class CustomersController < ApplicationController
  before_action(:require_login)

  def index
    @customers = current_user.customers.includes(:projects)
  end

  def new
    @customer = current_user.organisations.first.customers.new
    @organisations = current_user.organisations
  end

  def create
    @customer = Customer.new(customer_params)
    if current_user.organisations.where(id: @customer.organisation_id).count == 1 && @customer.save
      redirect_to(customer_path(@customer), notice: t(".success"))
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @customer = current_user.customers.find(params[:id])
    @organisations = current_user.organisations
  end

  def show
    @customer = current_user.customers.find(params[:id])
    @organisations = current_user.organisations
  end

  def update
    @customer = current_user.customers.find(params[:id])
    if @customer.update(customer_update_params)
      redirect_to(edit_customer_path(@customer), notice: t(".success"))
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    customer = current_user.customers.find(params[:id])
    customer.destroy!
    redirect_to(customers_path, notice: t(".success"))
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :organisation_id)
  end

  def customer_update_params
    params.require(:customer).permit(:name)
  end
end
