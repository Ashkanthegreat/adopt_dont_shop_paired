class RemoveShelterIdFromPets < ActiveRecord::Migration[5.1]
  def change
    remove_column :pets, :shelter_id, :bigint
  end
end
