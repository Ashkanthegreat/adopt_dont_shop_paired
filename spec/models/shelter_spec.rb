require "rails_helper"

describe Shelter, type: :model do

  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @shelter3 = Shelter.create!(name: "Puppy Land", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", description: "It's a puppy", shelter_id: @shelter1.id)
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", description: "It's a puppy", shelter_id: @shelter1.id)
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", description: "It's a puppy", shelter_id: @shelter2.id)
    @review1 = @shelter1.reviews.create!(title: "Great Shelter", rating: "4.5", content: "I had an amazing experience", picture: nil)
    @review2 = @shelter1.reviews.create!(title: "Amazing Rescue", rating: "5", content: "Super friendly staff", picture: "https://imgur.com/rjS5VMO")
    @application1 = Application.create(name: "Taylor", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "I love pets")
    @application2 = Application.create(name: "Ash", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "Great Pet Owner!!!")
    @pet_app1 = PetApplication.create(pet_id: @pet1.id, application_id: @application1.id)
    @pet_app2 = PetApplication.create(pet_id: @pet2.id, application_id: @application2.id)
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :pets }
  end

  describe "methods" do
    it "#count_pets" do
      expect(@shelter1.count_pets).to eq(2)
      expect(@shelter2.count_pets).to eq(1)
      expect(@shelter3.count_pets).to eq(0)
    end

    it "#average_review_rating" do
      expect(@shelter1.average_review_rating).to eq("4.75")
    end

    it "#count_applications" do
      expect(@shelter1.count_applications).to eq(2)
      expect(@shelter3.count_applications).to eq(0)
    end
  end
end
