class User < ApplicationRecord
  validates_presence_of :email, :password, :api_key
  validates_uniqueness_of :email
  validates_uniqueness_of :api_key

  has_secure_password

  def create_favorite(location)
    coords = GeocodeService.new.get_coords(location)
    weather = Forecast.new.get_forecast("#{coords["lat"]},#{coords["lng"]}")
    self.favorites.create!(location: location, current_weather: weather["currently"])
    binding.pry
  end
end
