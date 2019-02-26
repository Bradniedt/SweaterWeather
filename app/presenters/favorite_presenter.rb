class FavoritePresenter
  def initialize(favorites)
    @faves = favorites
    @favorites = []
    get_weather
  end

  def get_weather
    @faves.each do |fave|
      weather = ForecastService.get_forecast(fave.location)
      @favorites << { location: fave.location, current_weather: weather["currently"] }
    end
    binding.pry
  end
end
