require "rails_helper"

describe Favorite do

  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", description: "It's a puppy", shelter_id: @shelter1.id)
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", description: "It's a puppy", shelter_id: @shelter1.id)
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", description: "It's a puppy", shelter_id: @shelter2.id)
  end

  describe "methods" do
    it "#total_count" do
      favorite = Favorite.new ([
        @pet1, @pet2, @pet3
        ])

      expect(favorite.total_count).to eq(3)
    end

    it "#add_pet" do
      favorite = Favorite.new(nil)
      favorite.add_pet(@pet1.id)
      favorite.add_pet(@pet2.id)

      expect(favorite.total_count).to eq(2)
    end

    it "#is_a_favorite" do
      favorite = Favorite.new(nil)
      favorite.add_pet(@pet1.id)
      favorite.add_pet(@pet2.id)

      expect(favorite.is_a_favorite?(@pet1.id)).to eq(true)
      expect(favorite.is_a_favorite?(@pet3.id)).to eq(false)
    end

    it "#remove_pet" do
      favorite = Favorite.new(nil)
      favorite.add_pet(@pet1.id)
      favorite.add_pet(@pet2.id)

      favorite.remove_pet(@pet1.id)

      expect(favorite.is_a_favorite?(@pet2.id)).to eq(true)
      expect(favorite.is_a_favorite?(@pet1.id)).to eq(false)
    end

    it "#remove_all" do
      favorite = Favorite.new(nil)
      favorite.add_pet(@pet1.id)
      favorite.add_pet(@pet2.id)

      favorite.remove_all

      expect(favorite.is_a_favorite?(@pet2.id)).to eq(false)
      expect(favorite.is_a_favorite?(@pet1.id)).to eq(false)
      expect(favorite.favorite_pets.empty?).to eq(true)
    end

    it "#id_to_object" do
      favorite = Favorite.new(nil)
      favorite.add_pet(@pet1.id)
      favorite.add_pet(@pet2.id)

      expect(favorite.id_to_object).to eq([@pet1, @pet2])
    end
  end
end
