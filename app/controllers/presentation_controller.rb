# frozen_string_literal: true

# Controller for landing page
class PresentationController < ApplicationController
  layout("landing")

  def index
  end

  def about
  end

  def contact
  end

  def kontrollansvarig
  end

  def connect
    render(layout: "connect")
  end

  def support
  end

  def form
  end

  def tasks
    render(layout: "application")
  end

  def task
    render(layout: "application")
  end

  def invoices
    render(layout: "application")
  end

  def invoice
    render(layout: "application")
  end

  def new_invoice
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
