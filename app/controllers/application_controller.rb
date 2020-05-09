# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery(with: :exception)
  helper_method :current_organisation

  protected

  def current_organisation
    @current_organisation ||= current_user.organisations.first
  end
end
