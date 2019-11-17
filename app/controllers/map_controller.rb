class MapController < ApplicationController
  SWEDEN = [10.510684, 55.037336, 24.177166, 69.060151]
  def index
    @companies, @search_value = search_place
    @company_geojson = company_geojson(@companies)
    render(layout: "map")
  end

  private

  def company_geojson(companies)
    {
      type: "FeatureCollection",
      features: companies.map(&:to_feature),
    }
  end

  def search_place
    search_value = params.fetch("search", nil)
    companies = if search_value
      Company.near(search_value, 50, units: "km")
    else
      Company.where.not(latitude: nil).where.not(longitude: nil)
    end

    [companies, search_value]
  end
end
