# frozen_string_literal: true

class SearchesController < ApplicationController
  include Pagy::Backend
  before_action(:require_login, except: [:company])

  def project
    @projects = Project.includes(:customer).text_search(search_param)
  end

  def customer
    search = params.fetch(:search, nil)
    customers = if search.present?
      Customer.fuzzy_search(search)
    else
      Customer.all
    end
    order = params.fetch(:order_by, nil)
    if order.present?
      customers = customers.order(order)
    end

    @pagy, @customers = pagy(customers)
  end

  def company
    respond_to do |format|
      format.html do
        redirect_to(map_path(search: search_param))
      end
      format.json {
        render(json: search_place.map(&:to_json))
      }
    end
  end

  private

  def search_param
    params.require(:search).fetch(:text, "")
  end

  def search_place
    search_value = params.fetch("search", "")
    companies = if search_value != ""
      Company.near(search_value, 50, units: "km")
    else
      Company.where.not(latitude: nil).where.not(longitude: nil)
    end

    companies
  end
end
