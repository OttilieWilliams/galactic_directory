class Person < ApplicationRecord
  include Capitalizable
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :affiliations

  validates :first_name, presence: true
  validates :species, presence: true
  validates :gender, presence: true
  validates :locations, presence: true
  validates :affiliations, presence: true

  def capitalizable_attrs
    %w[first_name last_name]
  end
end
