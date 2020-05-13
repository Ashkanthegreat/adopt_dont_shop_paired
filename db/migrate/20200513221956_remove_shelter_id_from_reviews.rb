class RemoveShelterIdFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :shelter_id, :bigint
  end
end
