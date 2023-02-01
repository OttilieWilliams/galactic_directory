require 'rails_helper'

RSpec.describe Affiliation, type: :model do
  it 'should have and belong to many people' do
    subject { described_class.new }
    assc = described_class.reflect_on_association(:people)
    expect(assc.macro).to eq :has_and_belongs_to_many
  end
end
