class CreateLocationsPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :locations_people do |t|
      t.belongs_to :location
      t.belongs_to :person

      t.timestamps
    end
  end
end
