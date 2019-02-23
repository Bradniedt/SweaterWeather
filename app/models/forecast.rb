class Forecast
  attr_reader :id, :weather_report, :currently, :daily, :hourly, :photo
  def initialize(data)
    @id = 1
    @weather_report = data
    @current = data["currently"]
    @daily = data["daily"]
    @hourly = data["hourly"]
    pic = PhotoService.new.get_photo(data["latitude"], data["longitude"])
    @photo = pic
  end

  def self.get_weather(lat, lon)
    results = ForecastService.new.get_forecast(lat, lon)
    new(results)
  end
end
