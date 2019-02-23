class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :weather_report, :currently, :daily, :hourly
end
