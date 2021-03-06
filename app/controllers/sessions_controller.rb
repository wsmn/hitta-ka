# frozen_string_literal: true

class SessionsController < Clearance::SessionsController
  layout("landing")

  protected

  def url_after_create
    account_path
  end

  def url_after_destroy
    root_path
  end
end
