require 'rails_helper'

describe 'Forecast API' do
  it 'should return JSON data for a forecast' do
    VCR.use_cassette('forecast') do
      get  '/api/v1/forecast?location=denver,co'

      data = JSON.parse(response.body)
      expect(response).to be_successful
      expect(data).to have_key("latitude")
      expect(data).to have_key("longitude")
      expect(data).to have_key("timezone")
      expect(data).to have_key("currently")
      expect(data).to have_key("hourly")
    end
  end
end
