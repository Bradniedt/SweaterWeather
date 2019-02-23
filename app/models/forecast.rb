class Forecast
  attr_reader :id, :weather_report, :currently, :daily, :hourly
  def initialize(data)
    @id = 1
    @weather_report = data
    @current = data["currently"]
    @daily = data["daily"]
    @hourly = data["hourly"]
  end

  def self.get_weather(lat, lon)
    results = ForecastService.new.get_forecast(lat, lon)
    new(results)
  end
end
