class Forecast
  attr_reader :id, :timezone, :currently, :daily, :hourly
  def initialize(data)
    @id = 1
    @timezone = data["timezone"]
    @currently = data["currently"]
    @daily = data["daily"]
    @hourly = data["hourly"]
  end

  def self.get_weather(coords)
    results = ForecastService.new.get_forecast(coords)
    new(results)
  end
end
