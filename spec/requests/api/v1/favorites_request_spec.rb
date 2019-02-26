require 'rails_helper'

describe '(Favorites Endpoint) As a user' do
  describe 'when I send a POST request with a location and my api key to /api/v1/favorites' do
    before do
      @key1 = SecureRandom.base64
      @user1 = User.create!(email: "bob@email.com", password: "pass", api_key: @key)
      post '/api/v1/favorites', params: { "api_key" => "#{@key}", "location" => "Denver, CO" }
    end
    it 'should add that location to my favorites' do
      user = User.find(@user.id)
      favorite = user.favorites.first
      expect(response).to be_successful
      expect(favorite.user_id).to eq(user.id)
      expect(favorite.location).to eq("Denver, CO")
    end
    before do
      @key2 = SecureRandom.base64
      @bad_key = SecureRandom.base64
      @user2 = User.create!(email: "bob@email.com", password: "pass", api_key: @key)
      post '/api/v1/favorites', params: { "api_key" => "#{@bad_key}", "location" => "Denver, CO" }
    end
    it 'should not add that location to my favorites if my api key is wrong' do
      user = User.find(@user.id)

      expect(response).to_not be_successful
      expect(user.favorites).to eq([])
    end
  end
end
