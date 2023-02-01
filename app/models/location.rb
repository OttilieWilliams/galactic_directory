class Location < ApplicationRecord
  include Capitalizable
  has_and_belongs_to_many :people

  validates :name, presence: true

  def capitalizable_attrs
    ['name']
  end
end
