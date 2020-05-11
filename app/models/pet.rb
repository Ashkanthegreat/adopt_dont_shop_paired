class Pet < ApplicationRecord
  belongs_to :shelter
  attribute :adoption_status, default: "adoptable"
end
