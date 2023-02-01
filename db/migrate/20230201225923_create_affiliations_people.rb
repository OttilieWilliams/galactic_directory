class CreateAffiliationsPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :affiliations_people do |t|
      t.belongs_to :affiliation
      t.belongs_to :person

      t.timestamps
    end
  end
end
