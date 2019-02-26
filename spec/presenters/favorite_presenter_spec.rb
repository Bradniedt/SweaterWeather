require 'rails_helper'

describe 'Favorite Presenter' do
  before :each do
    @key = SecureRandom.base64
    @user = User.create!(email: "jill@email.com", password: "pass", api_key: @key)
    @user.favorites.create(location: "Denver, CO")
    @user.favorites.create(location: "Dillon, CO")
  end
  it 'exists' do
    faves = @user.favorites
    presenter = FavoritePresenter.new(faves)
    expect(presenter).to be_an_instance_of(FavoritePresenter)
  end
  it 'has_attributes' do
    faves = @user.favorites
    presenter = FavoritePresenter.new(faves)
    expect(presenter.id).to eq(1)
    expect(presenter.favorites).to be_an_instance_of Array
    expect(presenter.favorites.first).to have_key("location")
    expect(presenter.favorites.first).to have_key("current_weather")
    expect(presenter.favorites.first["location"]).to eq("Denver, CO")
  end
  it 'delete_favorite' do
    fave = @user.favorites.first
    presenter = FavoritePresenter.new(fave, "delete")
    all_faves = Favorite.all
    expect(presenter.id).to eq(1)
    expect(presenter.favorites).to be_an_instance_of Array
    expect(presenter.favorites.first).to have_key("location")
    expect(all_faves.length).to eq(2)
  end
end
