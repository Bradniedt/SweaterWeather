require 'rails_helper'

describe '(Login Endpoint) as a new user' do
  describe 'as a new user, when I send a post request to /api/v1/users with an email, password, and password confirmation' do
    it 'should return my api key in a JSON response' do
      params = { :user => { "email" => "bob@email.com", "password" => "pass", "password_confirmation" => "pass"}}
      post  '/api/v1/users', params.to_json, {'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}

      data = JSON.parse(response.body)["data"]["attributes"]
      expect(response).to be_successful
      expect(data).to have_key("api_key")
    end
  end
end
