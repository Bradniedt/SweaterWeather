class Forecast
  attr_reader :id, :weather_report, :currently, :daily, :hourly, :photo
  def initialize(data)
    @id = 1
    @weather_report = data
    @current = data["currently"]
    @daily = data["daily"]
    @hourly = data["hourly"]
    @photo = PhotoService.new.get_photo(data["latitude"], data["longitude"])
  end
end
