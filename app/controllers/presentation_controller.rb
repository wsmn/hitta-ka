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

  def connect
    render(layout: "connect")
  end

  def support
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
