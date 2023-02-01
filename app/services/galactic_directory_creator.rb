require 'csv'
class GalacticDirectoryCreator
  attr_reader :errors

  def initialize(file)
    @table = CSV.parse(file, headers: true)
    @errors = []
  end

  def run
    @table.each_with_index do |row, index|
      next unless row['Affiliations']

      process_row(row, index)
    end
  end

  def process_row(row, index)
    first_name, last_name = first_and_last_name(row['Name'])
    Person.create!(
      first_name: first_name, last_name: last_name,
      species: row['Species'],
      gender: row['Gender'],
      weapon: row['Weapon'],
      vehicle: row['Vehicle'],
      locations: find_or_create_associations('Location', row['Location']),
      affiliations: find_or_create_associations('Affiliation', row['Affiliations'])
    )
  rescue Exception => e
    @errors << "Row #{index} failed to process: #{e.message}"
  end

  def first_and_last_name(name)
    name.split(' ', 2)
  end

  def find_or_create_associations(association_class, associations)
    associations.split(',').map { |association| association_class.constantize.find_or_create_by(name: association) }
  end
end

