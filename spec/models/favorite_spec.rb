require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:location)}
    it { should validate_presence_of(:current_weather)}
    it { should belong_to(:user)}
  end
end
