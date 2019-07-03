# frozen_string_literal: true

# Controller for landing page
class PresentationController < ApplicationController
  before_action(:require_login, only: :account)
  layout('landing')
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
    layout('application')
    @customers=Customer.all
    @counts = {
      active: Project.active.count,
      completed: Project.completed.count,
      total: Project.all.count,
    }
  end

end
