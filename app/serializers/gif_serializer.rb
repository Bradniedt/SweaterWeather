class GifSerializer
  include FastJsonapi::ObjectSerializer
  attributes :images, :copyright
end
