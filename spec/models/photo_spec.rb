require 'rails_helper'

describe Photo, type: :model do
  before :each do
    @data = 'a url'
    @photo = Photo.new(@data)
  end
  it 'exists' do
    expect(@photo).to be_an_instance_of(Photo)
  end
  it 'has_attributes' do
    expect(@photo.id).to eq(1)
    expect(@photo.url).to eq(@data)
  end
  describe 'class methods' do
    it 'get_url' do
      VCR.use_cassette('photo_model') do
        photo = Photo.get_url("Denver, CO")
        expect(photo).to be_an_instance_of(Photo)
      end
    end
  end
end
