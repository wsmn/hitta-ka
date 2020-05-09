class OrganisationsController < ApplicationController
  def show
  end

  def update
    if current_organisation.update(organisation_params)
      redirect_to(account_organisation_url, notice: t(".success"))
    else
      render(:show, status: :unprocessable_entity)
    end
  end

  private

  def organisation_params
    params.require(:organisation).permit(
      :city,
      :country,
      :currency,
      :currency_format,
      :date_format,
      :email,
      :first_day_of_week,
      :first_month_of_year,
      :language,
      :logo,
      :phone,
      :street,
      :time_format,
      :time_zone,
      :title,
      :vat,
      :website,
      :zip_code
    )
  end
end
