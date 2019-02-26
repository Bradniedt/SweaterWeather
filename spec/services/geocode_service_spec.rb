require 'rails_helper'

describe 'Geocode service' do
  before :each do
    @service = GeocodeService.new
  end
  it 'exists' do
    expect(@service).to be_an_instance_of(GeocodeService)
  end
  it 'returns coordinates when given a city and state' do
    VCR.use_cassette("geocode") do
      data = @service.get_coords("Denver, CO")

      expect(data).to have_key("lat")
      expect(data).to have_key("lng")
    end
  end
  it 'uses a cached location to get coordinates when an identical search is made' do
    VCR.use_cassette("geocode_location") do
      data = @service.get_coords("Denver, CO")
      data2 = @service.get_coords("Denver, CO")
      location = Location.last

      expect(location.city).to eq("Denver, CO")
      expect(data).to have_key("lat")
      expect(data).to have_key("lng")
      expect(data2).to have_key("lat")
      expect(data2).to have_key("lng")
    end
  end
end
