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
    before :each do
      @key3 = SecureRandom.base64
      @user3 = User.create!(email: "jill@email.com", password: "pass", api_key: @key3)
      @user3.favorites.create(location: "Denver, CO")
      @key4 = SecureRandom.base64
      @user4 = User.create!(email: "jane@email.com", password: "pass", api_key: @key4)
    end
    it 'should list all of my favorite locations with their current weather' do
      VCR.use_cassette('favorites_list') do
        get '/api/v1/favorites', params: { "api_key" => "#{@key3}" }

        user = User.find(@user3.id)
        favorite = user.favorites.first
        data = JSON.parse(response.body)["data"]["attributes"]

        expect(response).to be_successful
        expect(favorite.user_id).to eq(user.id)
        expect(favorite.location).to eq("Denver, CO")
        expect(data["favorites"].first).to have_key("location")
        expect(data["favorites"].first["location"]).to eq("Denver, CO")
        expect(data["favorites"].first).to have_key("current_weather")
      end
    end
    it 'should return a 401 if my api key is wrong' do
      get '/api/v1/favorites', params: { "api_key" => "#{@bad_key}" }

      expect(response).to_not be_successful
      expect(status).to eq(401)
    end
  end
  describe 'when I send a DELETE request with a location and my api key to /api/v1/favorites' do
    before :each do
      @key5 = SecureRandom.base64
      @user5 = User.create!(email: "jill@email.com", password: "pass", api_key: @key5)
      @user5.favorites.create(location: "Denver, CO")
      @user5.favorites.create(location: "Dillon, CO")
      @key6 = SecureRandom.base64
      @user6 = User.create!(email: "jane@email.com", password: "pass", api_key: @key6)
    end
    it 'should delete the specified favorite location and return it to me' do
      VCR.use_cassette('favorites_delete') do
        delete '/api/v1/favorites', params: { "api_key" => "#{@key5}", "location" => "Dillon, CO" }

        user = User.find(@user5.id)
        favorites = user.favorites.all
        data = JSON.parse(response.body)["data"]["attributes"]

        expect(response).to be_successful
        expect(favorites.length).to eq(1)
        expect(favorite.first.location).to eq("Denver, CO")
        expect(data["favorites"].first).to have_key("location")
        expect(data["favorites"].first["location"]).to eq("Dillon, CO")
        expect(data["favorites"].first).to have_key("current_weather")
      end
    end
    it 'should return a 401 if my api key is wrong' do
      delete '/api/v1/favorites', params: { "api_key" => "#{@bad_key}", "location" => "Denver, CO" }

      favorites = user.favorites.all
      
      expect(response).to_not be_successful
      expect(status).to eq(401)
      expect(favorites.length).to eq(1)
      expect(favorite.first.location).to eq("Denver, CO")
    end
  end
end
