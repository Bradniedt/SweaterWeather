require 'rails_helper'

describe '(Registration Endpoint) as a new user' do
  describe 'as a new user, when I send a post request to /api/v1/users with an email, password, and password confirmation' do
    before { post '/api/v1/users', params: { :user => { "email" => "bob@email.com", "password" => "pass", "password_confirmation" => "pass"} }}
    it 'should create a new user in the database and return my api key in a JSON response' do

      data = JSON.parse(response.body)["data"]["attributes"]
      user = User.last
      expect(user.email).to eq("bob@email.com")
      expect(user.api_key).to eq(data["api_key"])
      expect(response).to be_successful
      expect(data).to have_key("api_key")
      expect(data["api_key"].length).to eq(24)
    end
  end
end
