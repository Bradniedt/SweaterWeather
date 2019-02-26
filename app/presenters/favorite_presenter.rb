class FavoritePresenter
  attr_reader :id, :favorites
  def initialize(favorites)
    @id = 1
    @faves = favorites
    @favorites = []
    get_weather
  end

  def get_weather
    @faves.each do |fave|
      weather = ForecastService.new.get_forecast(fave.location)
      @favorites << { location: fave.location, current_weather: weather["currently"] }
    end
  end
end
