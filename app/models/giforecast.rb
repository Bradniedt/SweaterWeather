class Giforecast
  def initialize(weather_data, gif_data)
    @id = 1
    @time = weather_data["daily"]["date"]  #placeholder keys
    @summary = weather_data["daily"]["summary"]
    @url = gif_data["daily"]["summary"]
  end

  def get_weather_gifs(location)
    coords = GeocodeService.new.get_coords(location)
    weather = ForecastService.new.get_forecast(coords)
    summaries = weather["daily"].map do |daily|
      daily["summary"].split(' ')
    end
    daily_gifs = GifService.new.get_gifs()
  end
end
