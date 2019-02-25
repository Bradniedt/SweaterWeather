class GifPresenter
  attr_reader :id, :images, :copyright
  def initialize(gifs)
    @id = 1
    @images = gifs
    @copyright = "2019"
  end
end
