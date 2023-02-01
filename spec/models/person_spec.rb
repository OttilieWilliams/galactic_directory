require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'should have and belong to many locations' do
    subject { described_class.new }
    assc = described_class.reflect_on_association(:locations)
    expect(assc.macro).to eq :has_and_belongs_to_many
  end

  it 'should have and belong to many affiliations' do
    subject { described_class.new }
    assc = described_class.reflect_on_association(:affiliations)
    expect(assc.macro).to eq :has_and_belongs_to_many
  end
end
