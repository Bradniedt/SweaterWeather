class ForecastService
  def conn
    Faraday.new("https://api.darksky.net/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_forecast(coords)
    response = conn.get("forecast/#{ENV['DARKSKY_KEY']}/#{coords}")
    results = JSON.parse(response.body)
    binding.pry
  end

end
