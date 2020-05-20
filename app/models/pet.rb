class Pet < ApplicationRecord
  validates_presence_of :image, :name, :description, :approximate_age, :sex
  belongs_to :shelter
  has_many :pet_applications, dependent: :destroy
  has_many :applications, through: :pet_applications, dependent: :destroy
  attribute :adoption_status, default: "adoptable"
end
