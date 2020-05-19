class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates_presence_of :name, :address, :city, :state, :zip

  def count_pets
    pets.count
  end

  def average_review_rating
    reviews_count = reviews.count
    reviews_sum = reviews.sum { |review| review.rating.to_f}
    (reviews_sum/reviews_count).to_s
  end

  def count_applications
    total_apps = []
    pets.each do |pet|
      total_apps << pet.applications
    end
    total_apps.uniq.count
  end
end
