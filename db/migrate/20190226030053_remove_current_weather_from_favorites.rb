class RemoveCurrentWeatherFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :current_weather 
  end
end
