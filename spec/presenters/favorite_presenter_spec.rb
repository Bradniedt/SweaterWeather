require 'rails_helper'

describe 'Favorite Presenter' do
  before :each do
    @key = SecureRandom.base64
    @user = User.create!(email: "jill@email.com", password: "pass", api_key: @key)
    @user.favorites.create(location: "Denver, CO")
    @user.favorites.create(location: "Dillon, CO")
    @key2 = SecureRandom.base64
    @user2 = User.create!(email: "jane@email.com", password: "pass", api_key: @key2)
    @user2.favorites.create(location: "Denver, CO")
    @user2.favorites.create(location: "Dillon, CO")
  end
  it 'exists' do
    VCR.use_cassette('fave_presenter_1') do
      faves = @user.favorites
      presenter = FavoritePresenter.new(faves)
      expect(presenter).to be_an_instance_of(FavoritePresenter)
    end
  end
  it 'has_attributes' do
    VCR.use_cassette('fave_presenter_2') do
      faves = @user.favorites
      presenter = FavoritePresenter.new(faves)
      expect(presenter.id).to eq(1)
      expect(presenter.favorites).to be_an_instance_of Array
      expect(presenter.favorites.first).to have_key("location")
      expect(presenter.favorites.first).to have_key("current_weather")
      expect(presenter.favorites.first["location"]).to eq("Denver, CO")
    end
  end
  it 'delete_favorite' do
    VCR.use_cassette('fave_presenter_3') do
      fave = @user2.favorites.first
      presenter = FavoritePresenter.new(fave, "delete")
      all_faves = User.find(@user2.id).favorites
      expect(presenter.id).to eq(1)
      expect(presenter.favorites.first).to have_key("location")
      expect(presenter.favorites.first["location"]).to eq("Denver, CO")
      expect(all_faves.length).to eq(1)
    end
  end
end
