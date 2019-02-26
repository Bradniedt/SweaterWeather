class GeocodeService
  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/") do |f|
      f.adapter Faraday.default_adapter
      f.params["key"] = ENV['GEOCODE_KEY']
    end
  end

  def get_data(place)
    response = conn.get("geocode/json?") do |request|
      request.params["address"] = place
    end
    data = JSON.parse(response.body)["results"].first["geometry"]["location"]
  end

  def get_coords(location)
    coord = Location.find_by(city: location)
    if coord
      return { "lat" => coord.latitude, "lng" => coord.longitude }
    else
      data = get_data(location)
      Location.create!(city: location, latitude: data["lat"], longitude: data["lng"])
      data
    end
  end

end
