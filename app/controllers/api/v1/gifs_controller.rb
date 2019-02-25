class Api::V1::GifsController < ApplicationController
  def index
    forecast = Giforecast.get_weather_gifs(params["location"])
    render json: GiforecastSerializer.new(forecast)
  end
end
