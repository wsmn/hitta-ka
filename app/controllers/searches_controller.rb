# frozen_string_literal: true

class SearchesController < ApplicationController
  before_action(:require_login, except: [:company])

  def project
    @projects = Project.includes(:customer)
      .text_search(search_param)
  end

  def customer
    @customers = Customer.text_search(search_param)
  end

  def company
    respond_to do |format|
      format.html {
        redirect_to(map_path(search: search_param))
      }
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
    search_value = params.fetch("search", {})
    companies = if search_value != {}
      Company.near(search_value, 50, units: "km")
    else
      Company.where.not(latitude: nil).where.not(longitude: nil)
    end

    companies
  end
end
