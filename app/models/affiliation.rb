class Affiliation < ApplicationRecord
  has_and_belongs_to_many :people

  validates :name, presence: true
end
