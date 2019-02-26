require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_presence_of(:api_key)}
    it { should validate_uniqueness_of(:api_key)}
  end
  describe 'instance methods' do
    it 'create_favorite' do
      VCR.use_cassette('favorite_user_model') do
        key = SecureRandom.base64
        user = User.create!(email: "bob@email.com", password: "pass", api_key: @key)
        user.create_favorite("Denver, CO")
        favorite = user.favorites.first

        expect(favorite.user_id).to eq(user.id)
        expect(favorite.location).to eq("Denver, CO")
        expect(favorite.current_weather).to have_key("time")
        expect(favorite.current_weather).to have_key("summary")
        expect(favorite.current_weather).to have_key("temperature")
      end
    end
  end
end
