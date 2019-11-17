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
    end
  end

  private

  def search_param
    params.require(:search).fetch(:text, "")
  end
end
