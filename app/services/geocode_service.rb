class GeocodeService
  def conn
    Faraday.new("https://maps.googleapis.com/maps/api/") do |f|
      f.adapter Faraday.default_adapter
      f.params["key"] = ENV['GEOCODE_KEY']
    end
  end

  def get_coords(location)
    response = conn.get("geocode/json?") do |request|
      request.params["address"] = location
    end
    data = JSON.parse(response.body)["results"].first["geometry"]["location"]
  end
end
