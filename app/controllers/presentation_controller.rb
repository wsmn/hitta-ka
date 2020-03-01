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
end
