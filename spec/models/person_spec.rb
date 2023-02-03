require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:locations) }
    it { should have_and_belong_to_many(:affiliations) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:species) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:locations) }
    it { should validate_presence_of(:affiliations) }
  end
end
