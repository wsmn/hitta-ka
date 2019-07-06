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
  end

  def connect
  end

  def support
  end

  def home2
  end

  def account
    @customers = []
    @counts = {
      active: 8,
      completed: 5,
      total: 4,
    }
    render(layout: 'application')
  end
end
