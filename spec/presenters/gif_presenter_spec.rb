require 'rails_helper'

describe 'Gif Presenter' do
  before :each do
    VCR.use_cassette('giforecast_model') do
      @images = Giforecast.get_weather_gifs("Denver, CO")
      @presenter = GifPresenter.new(@images)
    end
  end
  it 'exists' do
    expect(@presenter).to be_an_instance_of(GifPresenter)
  end
  it 'has_attributes' do
    expect(@presenter.id).to eq(1)
    expect(@presenter.images).to be_an_instance_of Array
    expect(@presenter.images.first).to be_an_instance_of Giforecast
  end
end
