require "rails_helper"

describe "Pets Index Page" do

  before :each do
    @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")
    @shelter2 = Shelter.create!(name: "Kitty Rescue", address: "1505 Kitty Dr.", city: "Denver", state: "Colorado", zip: "80025")
    @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", description: "It's a puppy", shelter_id: @shelter1.id, adoption_status: "adoptable")
    @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", description: "It's a puppy", shelter_id: @shelter1.id, adoption_status: "adoptable")
    @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", description: "It's a puppy", shelter_id: @shelter2.id, adoption_status: "adoptable")

    @application1 = Application.create(name: "Taylor", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "I love pets")
    @application2 = Application.create(name: "Ash", address: "1805 Main St.", city: "Superior", state: "CO", zip: "80027", phone: "555-555-5555", description: "Great Pet Owner!!!")
    @pet_app1 = PetApplication.create(pet_id: @pet1.id, application_id: @application1.id)
    @pet_app2 = PetApplication.create(pet_id: @pet2.id, application_id: @application1.id)
    @pet_app3 = PetApplication.create(pet_id: @pet1.id, application_id: @application2.id)
    @pet_app3 = PetApplication.create(pet_id: @pet2.id, application_id: @application2.id)
  end

  describe "When I visit '/pets'" do
    it "Can see each pet in the system" do

      visit "/pets"

      find("img[src*='https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg']")
      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.approximate_age)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content(@shelter1.name)


      expect(page).to have_content(@pet2.name)
      expect(page).to have_content(@pet2.approximate_age)
      expect(page).to have_content(@pet2.sex)
      expect(page).to have_content(@shelter1.name)
    end

    it "can update a pet's info" do

      visit "/pets"
      click_on "Update #{@pet1.name}"

      expect(current_path).to eq("/pets/#{@pet1.id}/edit")
    end

    it "can delete a pet" do

      visit "/pets"
      click_on "Delete #{@pet1.name}"

      expect(current_path).to eq("/pets")
      expect(page).to have_content(@pet2.name)
      expect(page).to have_content(@pet3.name)
      expect(page).to_not have_content(@pet1.name)
    end

    it "Can not delete a pet if the pet has a approved application" do

      visit "/applications/#{@application1.id}"

      expect(@pet_app1.approved).to eq(false)
      
      within("#pet-#{@pet1.id}") do
        click_on "Approve Application"
      end

      visit "/pets"

      within("#pet-#{@pet1.id}") do
        expect(page).to_not have_link("Delete")
      end
    end
  end
end
