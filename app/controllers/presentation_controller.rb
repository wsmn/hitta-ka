# frozen_string_literal: true

# Controller for landing page
class PresentationController < ApplicationController
  before_action(:require_login, only: :account)
  layout("landing")
  def index
  end

  def about
  end

  def contact
  end

  def kontrollansvarig
  end

  def map
    @companies = Company.where.not(latitude: nil, longitude: nil)
    @company_geojson = company_geojson(@companies)
    render layout: "map"
  end

  def connect
  end

  def support
  end

  def home2
    @companies = Company.where.not(latitude: nil, longitude: nil)
    @company_geojson = company_geojson(@companies)
    render layout: "map"
  end

  def form
  end

  def account
    @customers = []
    @counts = {
      active: 8,
      completed: 5,
      total: 4,
    }
    render(layout: "application")
  end

  def settings
    render(layout: "application")
  end

  def projects
    render(layout: "application")
  end

  def project
    render(layout: "application")
  end

  private

  def company_geojson(companies)
    {
      type: "FeatureCollection",
      features: companies.map(&:to_feature),
    }
  end
end
