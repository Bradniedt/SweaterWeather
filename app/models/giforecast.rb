class Giforecast
  def initialize
    @id = 1
    @time = weather_data  #placeholder keys
    @summary = weather_data
    @url = gif_data
  end

  def self.get_weather_gifs(location)
    coords = GeocodeService.new.get_coords(location)
    coordinates = "#{coords["lat"]},#{coords["lng"]}"
    weather = ForecastService.new.get_forecast(coordinates)
    summaries = weather["daily"].map do |daily|
      daily["summary"]
    end 
    binding.pry
    daily_gifs = GifService.new.get_gifs()
  end
end
