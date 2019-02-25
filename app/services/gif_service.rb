class GifService
  def conn
    Faraday.new("http://api.giphy.com/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_url(url, search_terms)
    response = conn.get("v1/gifs/search") do |request|
      request.params["api_key"] = ENV['GIPHY_KEY']
      request.params["q"] = search_terms
      request.params["limit"] = 5
    end
  end

  def get_gif(terms)
    response = get_url("v1/gifs/search", terms)
    result = JSON.parse(response.body)["data"].shuffle.first["url"]
  end
end
