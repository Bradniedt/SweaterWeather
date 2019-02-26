class ForecastService
  def conn
    Faraday.new("https://api.darksky.net/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_forecast(location)
    coords = GeocodeService.new.get_coords(location)
    coordinates = "#{coords["lat"]},#{coords["lng"]}"
    response = conn.get("forecast/#{ENV['DARKSKY_KEY']}/#{coordinates}")
    results = JSON.parse(response.body)
  end
end
