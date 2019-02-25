require 'rails_helper'

describe '(Gif Endpoint) As a user' do
  describe 'when I send a GET request to /api/v1/gifs?location=denver,co' do
    it 'should return an hourly forecast with the time, weather summary, and a gif url' do
      # VCR.use_cassette('gif_forecast') do
        get  '/api/v1/gifs?location=denver,co'

        data = JSON.parse(response.body)["data"]["attributes"]
        expect(response).to be_successful
        expect(data).to have_key("images")
        expect(data).to have_key("copyright")
        expect(data["images"].first).to have_key("time")
        expect(data["images"].first).to have_key("summary")
        expect(data["images"].first).to have_key("url")
      # end
    end
  end
end
