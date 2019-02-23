class PhotoService
  def conn
    Faraday.new("https://api.flickr.com/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_photo(coords)
    response = conn.get("services/rest/") do |request|
      request.params['method'] = "flickr.photos.getRecent"
      request.params['api_key'] = ENV['FLICKR_KEY']
      request.params['format'] = "json"
      request.params['lat'] = coords["lat"]
      request.params['lon'] = coords["lng"]
    end
    results = JSON.parse(response.body)
  end
end
