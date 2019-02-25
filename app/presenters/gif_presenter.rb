class GifPresenter
  attr_reader :id, :images
  def initialize(gifs)
    @id = 1
    @images = gifs
  end
end
