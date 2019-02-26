require 'rails_helper'

describe Location, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:latitude)}
    it { should validate_presence_of(:longitude)}
  end
end
