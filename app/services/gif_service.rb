class GifService
  def conn
    Faraday.new("http://api.giphy.com/") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_url(url, search_terms)
    new_terms = search_terms.gsub(" ", "+")
    response = conn.get("v1/gifs/search") do |request|
      request.params["api_key"] = ENV['GIPHY_KEY']
      request.params["q"] = new_terms
      request.params["limit"] = 10
    end
  end

  def get_gif(terms)
    response = get_url("v1/gifs/search", terms)
    nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    nums.shuffle!
    result = JSON.parse(response.body)["data"][nums.pop]["images"]["downsized"]["url"]
  end
end
