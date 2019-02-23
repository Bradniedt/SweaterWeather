class Api::V1::ForecastController < ApplicationController
  def index
    coords = GeocodeService.new.get_coords(params[:location])
    binding.pry
    forecast = ForecastService.new.get_forecast(coords["lat"], coords["lng"])
    render json: ForecastSerializer.new(forecast)
  end
end
