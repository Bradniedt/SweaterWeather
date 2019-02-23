require 'rails_helper'

describe 'Forecast service' do
  before :each do
    @service = ForecastService.new
  end
  it 'exists' do
    expect(@service).to be_an_instance_of(ForecastService)
  end
  it 'returns weather data when given coordinates' do
    VCR.use_cassette("forecast") do
      data = @service.get_data("37.8267", "-122.4233")

      expect(data).to have_key("latitude")
      expect(data).to have_key("longitude")
      expect(data).to have_key("timezone")
      expect(data).to have_key("currently")
      expect(data).to have_key("hourly")
      expect(data).to have_key("daily")
    end
  end
end
