require 'rails_helper'

describe '(Login Endpoint) as a user' do
  describe 'when I send a post request to /api/v1/sessions with an email and password' do
    before :each do
      @key = SecureRandom.base64
      @user = User.create!(email: "bob@email.com", password: "pass", api_key: @key)
      post '/api/v1/sessions', params: { "email" => "bob@email.com", "password" => "pass"}
    end
    it 'should log me in and return my api key in a JSON response' do
      data = JSON.parse(response.body)["data"]["attributes"]

      expect(response).to be_successful
      expect(data).to have_key("api_key")
      expect(data["api_key"].length).to eq(24)
      expect(data["api_key"].length).to eq(@key)
    end
  end
end
