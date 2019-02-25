class Api::V1::ForecastController < ApplicationController
  def index
    # move this geocode service into the 
    coords = GeocodeService.new.get_coords(params[:location])
    forecast = Forecast.get_weather("#{coords["lat"]},#{coords["lng"]}")
    render json: ForecastSerializer.new(forecast)
  end
end
