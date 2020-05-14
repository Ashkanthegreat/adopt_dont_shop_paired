require "rails_helper"

describe Favorite do

  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", shelter_id: @shelter1.id)
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", shelter_id: @shelter1.id)
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", shelter_id: @shelter2.id)
  end

  describe "#total_count" do
    it "can calculate the total number of favorited pets" do
      favorite = Favorite.new ([
        @pet1, @pet2, @pet3
        ])

      expect(favorite.total_count).to eq(3)
    end
  end
end
