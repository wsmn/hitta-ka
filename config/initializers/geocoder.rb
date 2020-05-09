Geocoder.configure(
  # street address geocoding service (default :nominatim)
  lookup: :mapbox,

  # to use an API key:
  api_key: ENV.fetch("MAPBOX_SEARCH_API_KEY", ""),

  # geocoding service request timeout, in seconds (default 3):
  timeout: 5,

  # set default units to kilometers:
  units: :km
)
