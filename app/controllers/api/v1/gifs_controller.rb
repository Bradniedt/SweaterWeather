class Api::V1::GifsController < ApplicationController
  def index
    forecasts = Giforecast.get_weather_gifs(params["location"])
    render json: GiforecastSerializer.new(forecasts)
  end
end
