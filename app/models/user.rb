class User < ApplicationRecord
  validates_presence_of :email, :password, :api_key
  validates_uniqueness_of :email
  validates_uniqueness_of :api_key

  has_many :favorites

  has_secure_password

  def create_favorite(location)
    coords = GeocodeService.new.get_coords(location)
    weather = ForecastService.new.get_forecast("#{coords["lat"]},#{coords["lng"]}")["currently"]
    self.favorites.create(location: location, current_weather: weather)
  end
end
