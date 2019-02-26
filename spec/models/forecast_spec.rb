require 'rails_helper'

describe Forecast, type: :model do
  before :each do
    @data = {
            "timezone" => 'a timezone',
            "currently" => 'a currently',
            "daily" => 'a daily',
            "hourly" => 'a hourly',
            }
    @forecast = Forecast.new(@data)
  end
  it 'exists' do
    expect(@forecast).to be_an_instance_of(Forecast)
  end
  it 'has_attributes' do
    expect(@forecast.id).to eq(1)
    expect(@forecast.timezone).to eq(@data["timezone"])
    expect(@forecast.currently).to eq(@data["currently"])
    expect(@forecast.daily).to eq(@data["daily"])
    expect(@forecast.hourly).to eq(@data["hourly"])
  end
  describe 'class methods' do
    it 'get_weather' do
      VCR.use_cassette('forecast_model') do
        forecast = Forecast.get_weather("Denver, CO")
        expect(forecast).to be_an_instance_of(Forecast)
      end
    end
  end
end
