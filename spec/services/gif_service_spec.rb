require 'rails_helper'

describe 'Gif service' do
  before :each do
    @service = GifService.new
  end
  it 'exists' do
    expect(@service).to be_an_instance_of(GifService)
  end
  it 'returns a gif url when given search terms' do
    VCR.use_cassette("gif_service") do
      data = @service.get_gif("Partly cloudy")

      expect(data.slice(0, 22)).to eq("https://giphy.com/gifs")
    end
  end
end
