require 'rails_helper'

describe Giforecast, type: :model do
  before :each do
    @data = [1551250800,
             'Partly cloudy throughout the day.',
             'https://giphy.com/gifs/clouds-movie-2Zx1Pa8Fcs9xu']
    @forecast = Giforecast.new(@data)
  end
  it 'exists' do
    expect(@forecast).to be_an_instance_of(Giforecast)
  end
  it 'has_attributes' do
    expect(@forecast.id).to eq(1)
    expect(@forecast.time).to eq(@data[0])
    expect(@forecast.summary).to eq(@data[1])
    expect(@forecast.url).to eq(@data[2])
  end
  describe 'class methods' do
    it 'get_weather_gifs' do
      VCR.use_cassette('giforecast_model') do
        forecasts = Giforecast.get_weather_gifs("Denver, CO")
        
        expect(forecasts.length).to eq(8)
        expect(forecasts[0]).to be_an_instance_of(Giforecast)
      end
    end
  end
end
