class Api::V1::ForecastController < ApplicationController
  def index
    forecast = Forecast.get_weather(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end
