class GifService
  def conn
    Faraday.new("http://api.giphy.com/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_gif(terms)
    response = conn.get("v1/gifs/search") do |request|
      request.params["api_key"] = ENV['GIPHY_KEY']
      request.params["q"] = terms
    end 
    results = JSON.parse(response.body)
  end
end
