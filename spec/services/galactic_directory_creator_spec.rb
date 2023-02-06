require 'rails_helper'

RSpec.describe GalacticDirectoryCreator, type: :model do
  describe '#run' do
    let(:headers) { %w[Name Location Species Gender Affiliations Weapon Vehicle] }
    let(:test_csv_file) do
      CSV.generate do |csv|
        csv << headers
        csv << row
      end
    end

    subject { described_class.new(test_csv_file) }

    context 'when the row data is correct' do
      let(:row) { ['Darth Vadar', 'Death Star,Tatooine', 'Human', 'Male', 'Sith', 'Lightsaber', 'Tiefighter'] }
      it 'creates the Person, the Location and the Affiliation with the correct attributes' do
        expect { subject.run }.to change { Person.count }.from(0).to(1).and \
          change { Affiliation.count }.from(0).to(1).and \
            change { Location.count }.from(0).to(2)

        expect(Person.last).to have_attributes(
          first_name: 'Darth',
          last_name: 'Vadar',
          species: 'Human',
          gender: 'Male',
          weapon: 'Lightsaber',
          vehicle: 'Tiefighter'
        )

        expect(Location.last).to have_attributes(
          name: 'Tatooine'
        )

        expect(Affiliation.last).to have_attributes(
          name: 'Sith'
        )
      end

      context 'when an affiliation already exists' do
        let!(:affiliation) { Affiliation.create(name: 'Sith') }
        it 'does not create another affiliation' do
          expect { subject.run }.to_not change { Affiliation.count }
        end
      end

      context 'when a location already exists' do
        let!(:location) { Location.create(name: 'Tatooine') }
        it 'only creates any locations that still do not exist' do
          expect { subject.run }.to change { Location.count }.from(1).to(2)
        end
      end
    end

    context 'when the row data is incorrect' do
      let(:row) { ['Darth Vadar', 'Death Star,Tatooine', '', 'Male', 'Sith', 'Lightsaber', 'Tiefighter'] }

      it 'adds an error and does not create any new objects for that row' do
        subject.run
        expect(subject.errors).to eql(["Row 0 failed to process: Validation failed: Species can't be blank"])
      end
    end
  end
end
