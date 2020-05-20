require 'rails_helper'

describe "Pet Applications Index" do
  describe "When I visit a pets show page" do
    before :each do
      @shelter1 = Shelter.create!(name: "Pups For You", address: "1808 Pup lane", city: "Denver", state: "Colorado", zip: "80027")

      @pet1 = Pet.create(image: "https://pixabay.com/get/54e7dd464a55a814f1dc8460da2932761d37d6e1555874_640.jpg", name: "Rosco", approximate_age: "5", sex: "Male", description: "It's a pup", shelter_id: @shelter1.id)

      @pet2 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Bob", approximate_age: "1", sex: "Male", description: "It's a pup", shelter_id: @shelter1.id)

      @pet3 = Pet.create(image: "https://pixabay.com/get/5ee0d44b4854b10ff3d89960c62d3f761d37dae25757_640.jpg", name: "Lars", approximate_age: "14", sex: "Male", description: "It's a pup", shelter_id: @shelter1.id)

      @application1 = Application.create(name: "Frank", address: "123 main st", city: "Denver", state: "CO", zip: "80210", phone: "720-555-5555", description: "I am a good person" )

      @application2 = Application.create(name: "Meg", address: "423 Elm St", city: "Denver", state: "CO", zip: "80231", phone: "720-777-7777", description: "I have adopted many pets" )

      @application3 = Application.create(name: "Mike", address: "424 Elms St", city: "Denver", state: "CO", zip: "80231", phone: "720-7657", description: "I love animals" )

      PetApplication.create({pet_id: @pet1.id, application_id: @application1.id})
      PetApplication.create({pet_id: @pet1.id, application_id: @application2.id})
      PetApplication.create({pet_id: @pet2.id, application_id: @application3.id})
    end


    it "I see a link to view all applications for this pet" do
      visit "/pets/#{@pet1.id}"

      click_on "View All Applications"

      expect(current_path).to eq("/pets/#{@pet1.id}/applications/index")

      expect(page).to have_content(@application1.name)
      expect(page).to have_content(@application2.name)

      expect(page).to_not have_content(@application3.name)
    end

    it "the name is a link to the application show page" do
      visit "/pets/#{@pet1.id}"

      click_on "View All Applications"

      click_on "#{@application1.name}"

      expect(current_path).to eq("/applications/#{@application1.id}")
    end

    it "Can see a a message when there is no application on a pet when I visit a pet applications index page" do
      visit "/pets/#{@pet3.id}"

      click_on "View All Applications"

      expect(page).to have_content("No Applications on this pet")
    end

  end
end
