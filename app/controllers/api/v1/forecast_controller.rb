class Api::V1::ForecastController < ApplicationController
  def index
    coords = GeocodeService.new.get_coords(params[:location])
    forecast = ForecastService.new.get_forecast("#{coords["lat"]},#{coords["lng"]}")
    binding.pry
    render json: ForecastSerializer.new(forecast)
  end
end
