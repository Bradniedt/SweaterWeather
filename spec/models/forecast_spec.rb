require 'rails_helper'

describe Forecast, type: :model do
  before :each do
    data = {
            "timezone" => 'a timezone',
            "currently" => 'a currently',
            "daily" => 'a daily',
            "hourly" => 'a hourly',
            }
    @forecast = Forecast.new(data)
  end
  it 'exists' do
    expect(@forecast).to be_an_instance_of(Forecast)
  end
  describe 'class methods' do
    it 'get_weather' do
      VCR.use_cassette('forecast_model') do
        forecast = Forecast.get_weather("37.8267,-122.4233")
        expect(forecast).to be_an_instance_of(Forecast)
      end
    end
  end
end
