require 'rails_helper'

describe 'Background / Flickr API' do
  it 'should return JSON data for a forecast' do
    VCR.use_cassette('forecast') do
      get  '/api/v1/backgrounds?location=denver,co'

      data = JSON.parse(response.body)["data"]["attributes"]
      expect(response).to be_successful
      expect(data).to have_key("url")
    end
  end
end
