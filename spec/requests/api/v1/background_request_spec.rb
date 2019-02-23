require 'rails_helper'

describe 'Background / Flickr API' do
  it 'should return JSON data for a photo' do
    VCR.use_cassette('photo_request') do
      get  '/api/v1/backgrounds?location=denver,co'

      data = JSON.parse(response.body)["data"]["attributes"]
      expect(response).to be_successful
      expect(data).to have_key("url")
    end
  end
end
