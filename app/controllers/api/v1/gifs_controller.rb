class Api::V1::GifsController < ApplicationController
  def index
    forecasts = Giforecast.get_weather_gifs(params["location"])
    render json: GifSerializer.new(GifPresenter.new(forecasts))
  end
end
