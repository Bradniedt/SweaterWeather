class FavoritesPresenter
  def initialize(user)
    @user = user
    @favorites = get_favorites
  end

  def get_favorites
    @user.favorites.each do |fave|
      coords = GeocodeService.new.get_coords(fave.location)
      weather = ForecastService.new.get_forecast("#{coords["lat"]},#{coords["lng"]}")
      
    end
  end
end
