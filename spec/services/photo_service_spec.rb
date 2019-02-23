require 'rails_helper'

describe 'Forecast service' do
  before :each do
    @service = PhotoService.new
  end
  it 'exists' do
    expect(@service).to be_an_instance_of(PhotoService)
  end
  it 'returns photo url when given coordinates' do
    VCR.use_cassette("photo") do
      data = @service.get_photo("37.8267", "-122.4233")

      expect(data).to have_key("url")
    end
  end
end
