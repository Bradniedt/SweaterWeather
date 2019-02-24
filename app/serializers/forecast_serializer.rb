class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :timezone, :currently, :daily, :hourly
end
