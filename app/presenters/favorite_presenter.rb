class FavoritePresenter
  attr_reader :id, :favorites
  def initialize(favorites, method = 'make')
    @id = 1
    @faves = favorites
    @favorites = []
    if method == "delete"
      delete_favorite
    else
      get_favorites
    end
  end


  def get_favorites
    @faves.each do |fave|
      weather = ForecastService.new.get_forecast(fave.location)
      @favorites << { "location" => fave.location, "current_weather" => weather["currently"] }
    end
  end

  def delete_favorite
    weather = ForecastService.new.get_forecast(@faves.location)
    @favorites << { "location" => @faves.location, "current_weather" => weather["currently"] }
    Favorite.destroy(@faves.id)
    @favorites
  end
end
