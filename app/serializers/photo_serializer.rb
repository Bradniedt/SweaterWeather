class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :url
end
