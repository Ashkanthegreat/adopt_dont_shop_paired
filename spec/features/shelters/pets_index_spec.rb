require "rails_helper"

describe "Shelter's Pet's index page" do

  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", shelter_id: @shelter1.id, adoption_status: "adoptable")
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", shelter_id: @shelter1.id, adoption_status: "adoptable")
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", shelter_id: @shelter2.id, adoption_status: "adoptable")

    @application1 = Application.create(name: "Taylor", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "I love pets")
    @application2 = Application.create(name: "Ash", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "Great Pet Owner!!!")
    @pet_app1 = PetApplication.create(pet_id: @pet1.id, application_id: @application1.id)
    @pet_app2 = PetApplication.create(pet_id: @pet2.id, application_id: @application1.id)
    @pet_app3 = PetApplication.create(pet_id: @pet1.id, application_id: @application2.id)
    @pet_app3 = PetApplication.create(pet_id: @pet2.id, application_id: @application2.id)
  end

  describe "When I visit '/shelters/:shelter_id/pets'" do
    it "can see each pet that can be adopted from that shelter" do

      visit "/shelters/#{@shelter1.id}/pets"

      find("img[src*='https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg']")
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.approximate_age)
      expect(page).to have_content(@pet1.sex)

      find("img[src*='https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg']")
      expect(page).to have_content(@pet2.name)
      expect(page).to have_content(@pet2.approximate_age)
      expect(page).to have_content(@pet2.sex)

      expect(page).to_not have_content(@pet3.name)
    end

    it "can add a new adoptable pet to that shelter" do

      visit "/shelters/#{@shelter1.id}/pets"

      click_link "Create Pet"

      expect(current_path).to eq("/shelters/#{@shelter1.id}/pets/new")

      fill_in :image, with: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg"
      fill_in :name, with: "Sammy"
      fill_in :description, with: "Rat Terrier"
      fill_in :approximate_age, with: "12.5"
      fill_in :sex, with: "male"

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{@shelter1.id}/pets")

      sammy = Pet.last

      expect(page).to have_content(sammy.name)

      click_on "#{sammy.name}"
      expect(page).to have_content("adoptable")
    end

    it "can update a pet's info" do

      visit "/shelters/#{@shelter1.id}/pets"

      click_on "Update #{@pet1.name}"

      expect(current_path).to eq("/pets/#{@pet1.id}/edit")
    end

    it "can delete a pet" do

      visit "/shelters/#{@shelter1.id}/pets"

      click_on "Delete #{@pet1.name}"

      expect(current_path).to eq("/pets")
      expect(page).to have_content(@pet2.name)
      expect(page).to_not have_content(@pet1.name)
    end
  end
end
