class Photo
  attr_reader :id
  attr_accessor :url
  def initialize(data)
    @id = 1
    @url = data
  end

  def self.get_url(location)
    service = PhotoService.new
    data = service.get_photo(location)
    url = service.build_url(data)
    new(url)
  end
end
