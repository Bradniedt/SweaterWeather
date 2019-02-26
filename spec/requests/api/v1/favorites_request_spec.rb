require 'rails_helper'

describe '(Favorites Endpoint) As a user' do
  describe 'when I send a POST request with a location and my api key to /api/v1/favorites' do
    before do
      @key1 = SecureRandom.base64
      @user1 = User.create!(email: "bob@email.com", password: "pass", api_key: @key1)
      post '/api/v1/favorites', params: { "api_key" => "#{@key1}", "location" => "Denver, CO" }
    end
    it 'should add that location to my favorites' do
      user = User.find(@user1.id)
      favorite = user.favorites.first

      expect(favorite.user_id).to eq(user.id)
      expect(favorite.location).to eq("Denver, CO")
    end
    before do
      @key2 = SecureRandom.base64
      @bad_key = SecureRandom.base64
      @user2 = User.create!(email: "george@email.com", password: "pass", api_key: @key2)
      post '/api/v1/favorites', params: { "api_key" => "#{@bad_key}", "location" => "Denver, CO" }
    end
    it 'should not add that location to my favorites if my api key is wrong' do
      user = User.find(@user2.id)

      expect(response).to_not be_successful
      expect(user.favorites).to eq([])
    end
  end
  describe 'when I send a GET request with my api key to /api/v1/favorites' do
    before do
      @key1 = SecureRandom.base64
      @user1 = User.create!(email: "bob@email.com", password: "pass", api_key: @key1)
      post '/api/v1/favorites', params: { "api_key" => "#{@key1}", "location" => "Denver, CO" }
      get '/api/v1/favorites', params: { "api_key" => "#{@key1}" }
    end
    it 'should list all of my favorite locations with their current weather' do
      # VCR.use_cassette('favorite_list') do
        user = User.find(@user1.id)
        favorite = user.favorites.first
        data = JSON.parse(response.body)["data"]["attributes"]

        expect(response).to be_successful
        expect(favorite.user_id).to eq(user.id)
        expect(favorite.location).to eq("Denver, CO")
        expect(data["favorites"].first).to have_key("location")
        expect(data["favorites"].first["location"]).to eq("Denver, CO")
        expect(data["favorites"].first).to have_key("current_weather")
      # end 
    end
  end
end
