require "rails_helper"

describe "Pet show page" do
  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", shelter_id: @shelter1.id)
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", shelter_id: @shelter1.id)
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", shelter_id: @shelter2.id)
  end

  describe "When I visit 'pets/:id'" do
    it "can see the pet with that id" do

      visit "pets/#{@pet1.id}"

      find("img[src*='https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg']")
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.description)
      expect(page).to have_content(@pet1.approximate_age)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content(@pet1.adoption_status)
    end

    it "can update that pet's information" do

      visit "pets/#{@pet1.id}"

      click_on "Update Pet"

      expect(current_path).to eq("/pets/#{@pet1.id}/edit")

      fill_in :description, with: "Cream colored Pom Pom"
      fill_in :approximate_age, with: "5.5"

      click_on "Update Pet"

      expect(current_path).to eq("/pets/#{@pet1.id}")

      expect(page).to have_content("Cream colored Pom Pom")
      expect(page).to have_content("5.5")
    end

    it "can delete a pet" do

      visit "pets/#{@pet1.id}"

      click_on "Delete Pet"

      expect(current_path).to eq("/pets")

      expect(page).to have_content(@pet2.name)
      expect(page).to have_content(@pet3.name)
      expect(page).to_not have_content(@pet1.name)
    end

    it "can favorite a pet" do
      visit "pets/#{@pet1.id}"

      click_on "Favorite Pet"

      expect(current_path).to eq("/pets/#{@pet1.id}")

      expect(page).to have_content("#{@pet1.name} has been added to your favorites list")

      expect(page).to have_content("Favorite Pets: 1")
    end
  end
end
