class Giforecast
  attr_reader :time, :summary, :url
  def initialize(data)
    @time = data[0].to_s
    @summary = data[1]
    @url = data[2]
  end

  def self.build_summaries(data)
    summaries = data["daily"]["data"].map do |daily|
      [daily["time"], daily["summary"]]
    end
  end

  def self.build_gifs(data)
    data.map do |summary|
      gif = GifService.new.get_gif(data[1])
      data << gif
    end
  end

  def self.get_weather_gifs(location)
    coords = GeocodeService.new.get_coords(location)
    coordinates = "#{coords["lat"]},#{coords["lng"]}"
    weather = ForecastService.new.get_forecast(coordinates)
    summaries = build_summaries(weather)
    binding.pry
    summaries_with_gifs = build_gifs(summaries)
    summaries_with_gifs.map do |summary|
      Giforecast.new(summary)
    end
  end
end
