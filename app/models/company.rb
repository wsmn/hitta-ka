class Company < ApplicationRecord
  geocoded_by(:geocode_address)
  after_validation(:geocode)

  def geocode_address
    [address["street"], address["postal_code"], address["city"], address["country"]].compact.join(", ")
  end

  def coordinates
    [longitude, latitude]
  end

  def to_s
    name
  end

  def to_json
    {
      id: self.id,
      name: self.name,
      address: self.geocode_address,
      coordinates: self.coordinates,
    }
  end

  def to_feature
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": coordinates,
      },
      "properties": {
        "company_id": id,
        "name": name,
      },
    }
  end
end
