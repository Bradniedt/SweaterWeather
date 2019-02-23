class PhotoService
  def conn
    Faraday.new("https://api.flickr.com/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_data(lat, lon)
    response = conn.get("services/rest/") do |request|
      request.params['method'] = "flickr.photos.getRecent"
      request.params['api_key'] = ENV['FLICKR_KEY']
      request.params['format'] = "json"
      request.params['lat'] = lat
      request.params['lon'] = lon
      request.params['nojsoncallback'] = "true"
      request.params['safe_search'] = "1"
    end
    results = JSON.parse(response.body)
  end

  def build_url(data)
    "https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg"
  end

  def get_photo(location)
    coords = GeocodeService.new.get_coords(location)
    get_data(coords["lat"], coords["lng"])
  end
end
