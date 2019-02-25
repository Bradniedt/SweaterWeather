class GiforecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, :summary, :url
end
