class MapController < ApplicationController
  def index
    @search_value = params.fetch(:search, "")
    render(layout: "map")
  end
end
