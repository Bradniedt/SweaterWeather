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
      data = @service.get_photo("Denver, CO")

      expect(data).to have_key("photos")
      expect(data["photos"]).to have_key("photo")
    end
  end
end
